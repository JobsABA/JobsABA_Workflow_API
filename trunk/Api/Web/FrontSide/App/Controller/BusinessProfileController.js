app.controller('BusinessDetailController', function ($scope, httpService, $rootScope, $http, $routeParams, $filter, $route) {

    $scope.init = function () {
        $scope.initModel();
        $scope.initJobModel();
        $rootScope.loginUserName = httpService.readCookie("uname");
        $scope.userId = parseInt(httpService.readCookie("uid"));
        $scope.BusinessId = parseInt($routeParams.BusinessId);

        //if ($scope.userId)
        //    $scope.checkBusinessUserOwner();
        //else
        //    $scope.getBussinessDetail($scope.BusinessId);
        $scope.getBussinessDetail($scope.BusinessId);
        $scope.randomNumber = Math.random();
        $scope.getJobList();
    }

    $scope.initModel = function () {
        //specialist
        $scope.addCompanySpecialistModel = {
            Name: ''
        }

        $scope.editCompanySpecialistModel = {
            id: '',
            Name: ''
        }
        //employee
        $scope.addCompanyEMPlistModel = {
            UserID: '',
            UserName: '',
            FirstName: '',
            LastName: '',
            MiddleName: '',
            State: '',
            EmailAddress: '',
            PhoneNumber: ''
        }

        $scope.editCompanyEMPlistModel = {
            UserID: '',
            UserName: '',
            FirstName: '',
            LastName: '',
            MiddleName: '',
            State: '',
            EmailAddress: '',
            PhoneNumber: ''
        }

        //company achievement
        $scope.addCompanyAchievelistModel = {
            Name: '',
            Date: '',
        }

        $scope.editCompanyAchievelistModel = {
            id: '',
            Name: '',
            Date: '',
            ImgUrl: ''
        }

        //company location
        $scope.addCompanyLocationlistModel = {
            Line1: '',
            Line2: '',
            City: '',
            State: '',
            ZipCode: '',
            Employee: '',
            Phone: ''

        }

        $scope.editCompanyLocationlistModel = {
            AddressID: '',
            Line1: '',
            Line2: '',
            City: '',
            State: '',
            ZipCode: '',
            Employee: '',
            Phone: ''
        }

    }

    $scope.initJobModel = function () {
        $scope.jobsModel = {
            JobID: '',
            BusinessID: '',
            Title: '',
            Description: '',
            JobTypeID: '',
            IsActive: true,
            IsDeleted: false,
            StartDate: '',
            EndDate: '',
        }
    }
    $scope.isUserBusinessOwner = true;
    $scope.checkBusinessUserOwner = function () {
        var params = {
            bussinessID: $scope.BusinessId,
            userID: $scope.userId
        }
        $http.get($rootScope.API_PATH + "/Jobapplication/CheckUserBusinessOwner", { params: params }).success(function (data) {
            if (data.success == 1)
                $scope.isUserBusinessOwner = data.message;
            $scope.getBussinessDetail($scope.BusinessId);
            $rootScope.reloadDatePicker();
        }).error(function (data) {
            console.log("error in fetch detail");
        });
    }

    //get company detail
    $scope.getBussinessDetail = function (bussinessID) {
        $("#companyProfilemainDiv").block({ message: '<img src="Assets/img/loader.gif" />' });
        $http.get($rootScope.API_PATH + "/Businesses/GetBusiness/" + bussinessID).success(function (data) {
            $("#companyProfilemainDiv").unblock();
            $scope.bussinessDetail = data;
            var busienssAddress = _.where(data.Addresses, { AddressID: data.PrimaryAddressID });
            $scope.businessAddress = busienssAddress[0];
            $scope.isEditProfile_Image = false;

            if (data.Achievement != null) {
                $scope.lstAchievelist = data.Achievement;
            }
            else
                $scope.lstAchievelist = [];

            if (data.Achievement != null) {
                $scope.lstLocationlist = data.Addresses;
            }
            else
                $scope.lstLocationlist = [];


        }).error(function (data) {
            toastr.error("error in get company detail, try again");
        })
    }

    //edit/update company detail
    $scope.updateCompanyDetail = function (obj, updateType, objAddress) {
        var params = {
            id: obj.BusinessID
        }

        if (updateType == "Address") {
            if (obj.Addresses != null) {
                for (var i = 0; i < obj.Addresses.length; i++) {
                    if (obj.Addresses[i].AddressID == obj.PrimaryAddressID) {
                        obj.Addresses[i] = objAddress;
                    }
                }
            }
        }

        $http.put($rootScope.API_PATH + "/Businesses/PutBusiness", obj, { params: params }).success(function (data) {
            toastr.success("company profile info update successfully");
            if (updateType == "Address") {
                $scope.isEditAddress = false;
                $scope.isEditCity = false;
                $scope.isEditState = false;
                $scope.isEditZipCode = false;
            }
            else if (updateType == "BussinessEmail")
                $scope.isEditEmail = false;
            else if (updateType == "Number")
                $scope.isEditNumber = false;
            else if (updateType == "Name")
                $scope.isEditCompanyName = false;
            else if (updateType == "Description")
                $scope.isEditCompanyDesription = false;

        }).error(function (data) {

        });
    }

    //company logo upload
    $scope.companyImageUpload = function () {
        var formData = new FormData();
        var totalFiles = document.getElementById("uploadimage").files.length;
        for (var i = 0; i < totalFiles; i++) {
            var file = document.getElementById("uploadimage").files[i];

            formData.append("fupload", file);
            formData.append("businessID", $scope.BusinessId);
            formData.append("imageTypeId", 3);
        }

        $("#companyProfileInfoDiv").block({ message: '<img src="Assets/img/loader.gif" />' });
        $.ajax({
            type: "POST",
            url: $rootScope.API_PATH + '/Company/Upload',
            data: formData,
            dataType: 'json',
            contentType: false,
            processData: false,
            cache: false,
            success: function (data) {
                $("#companyProfileInfoDiv").unblock();
                $scope.getBussinessDetail($scope.BusinessId);
                $scope.isEditProfile_Image = true;
                $scope.randomNumber = Math.random();
            },
            error: function (error) {
                $("#companyProfileInfoDiv").unblock();
                console.log('error in image upload');
            }
        });
    }


    //get job list
    $scope.getJobList = function () {
        var params = {
            id: $scope.BusinessId
        }
        $("#companyProfileJobDiv").block({ message: '<img src="Assets/img/loader.gif" />' });
        $http.get($rootScope.API_PATH + "/Jobs/GetJobByBusinessID", { params: params }).success(function (data) {
            $("#companyProfileJobDiv").unblock();
            console.log(data);
            for (var i = 0; i < data.length; i++) {
                if (data[i].insdt != null) {
                    data[i].insdt = $rootScope.setDateformat(data[i].insdt);
                }
                if (data[i].StartDate != null) {
                    data[i].StartDate = $rootScope.setDateformat(data[i].StartDate);
                }
                if (data[i].EndDate != null) {
                    data[i].EndDate = $rootScope.setDateformat(data[i].EndDate);
                }
            }
            if (!$scope.isUserBusinessOwner) {
                data = _.where(data, { IsActive: true });
            }
            $scope.lstJob = data;
            $rootScope.reloadDatePicker();
        }).error(function (data) {
            //alert("error");
        });
    }
    ////create job
    //$scope.createJob = function (obj) {
    //    if ($scope.jobsModel.Title == undefined || $scope.jobsModel.Title.length == 0) {
    //        toastr.error('Enter job title');
    //        return;
    //    }
    //    obj.BusinessID = $scope.BusinessId;
    //    obj.JobTypeID = 4;
    //    $http.post($rootScope.API_PATH + "/Jobs/PostJob", obj).success(function (data) {
    //        $scope.isEditSummery = false;
    //        $scope.initJobModel();
    //        $scope.getJobList();
    //        toastr.success("job created successfully");
    //    }).error(function (data) {
    //        toastr.error("error in job create");
    //    })

    //}

    ////update job
    //$scope.updateJob = function (obj) {
    //    if (obj.Title == undefined || obj.Title.length == 0) {
    //        toastr.error('Enter job title');
    //        return;
    //    }
    //    obj.JobID = 0;
    //    var params = {
    //        id: obj.JobID
    //    }

    //    $http.put($rootScope.API_PATH + "/Jobs/PutJob", obj, { params: params }).success(function (data) {
    //        toastr.success("job updated successfully");
    //        $scope["isEditJobList_" + obj.JobID] = false;
    //    }).error(function (data) {
    //        toastr.error("error in job update");
    //    })

    //}

    //delete job
    $scope.deleteJob = function (id) {
        var params = {
            id: id
        }
        $http.delete($rootScope.API_PATH + "/Jobs/DeleteJob", { params: params }).success(function (data) {
            $scope.getJobList();
            toastr.success("Job deleted sucessfully");
        }).error(function (data) {
            toastr.error("error in job delete");
        })
    }



    ////edit job detail
    //$scope.editJobDetail = function (id) {
    //    $scope["isEditJobList_" + id] = true;
    //    $rootScope.reloadDatePicker();
    //}

    ////cancel edit job detail
    //$scope.cancelJobDetailEdit = function (id) {
    //    $scope["isEditJobList_" + id] = false;
    //}

    //view job application
    $scope.viewApplivation = function (id) {
        if ($scope["isJobApplication_" + id] == true) {
            $scope["isJobApplication_" + id] = false;
        }
        else {

            var params = {
                JobID: id
            }
            $http.get($rootScope.API_PATH + "/Jobapplication/GetJobApplicationList", { params: params }).success(function (data) {
                for (var i = 0; i < data.applicationList.length; i++) {
                    if (data.applicationList[i].ApplicationDate != null) {
                        data.applicationList[i].ApplicationDate = $filter('date')(data.applicationList[i].ApplicationDate.substr(6, 13), "MM-dd-yyyy");
                    }
                }

                $scope.lstJobApplication = data.applicationList;

            }).error(function (data) {
                console.log(data);
            });
            $scope["isJobApplication_" + id] = true;
        }
    }

    //view job detail
    //$scope.viewJobDetail = function (id) {

    //    if ($scope["isJobDetail_" + id] == true)
    //        $scope["isJobDetail_" + id] = false;
    //    else
    //        $scope["isJobDetail_" + id] = true;

    //}

    //chnage job isActive 
    $scope.changeJobActive = function (jobID) {
        var params = {
            jobID: jobID
        }
        $http.get($rootScope.API_PATH + "/Jobapplication/ChangeJobDisplay", { params: params }).success(function (data) {
            if (data.success == 1) {

            }
            else {
                toastr.error("error in job activation toggle");
            }
        }).error(function (data) {

        })
    }

    //********************************* start edit specialist ************************************//
    $scope.isEditSpecialist = false;

    $scope.addCompanySpecialist = function (obj) {
        if (obj.Name == null || obj.Name == "") {
            toastr.error("enter specialist name");
            return;
        }
        var params = {
            Name: obj.Name,
            BusinessID: $scope.BusinessId
        }
        $("#companyProfileSpecialistDiv").block({ message: '<img src="Assets/img/loader.gif" />' });
        $http.post($rootScope.API_PATH + "/Services/PostService", params).success(function (data) {
            $("#companyProfileSpecialistDiv").unblock();
            toastr.success("Company Specialist added successfully");
            $scope.IsAddSpecialist = false;
            $scope.initModel();
            //$scope.getCompanySpecialist();
        }).error(function (data) {
            toastr.error("error in add service. try again.")
        });
    }

    $scope.deleteSpecialist = function (id) {
        var params = {
            id: id
        }
        $http.get($rootScope.API_PATH + "/Company/DeleteServices", { params: params }).success(function (data) {
            if (data.success == 1) {
                $scope.getCompanySpecialist();
                toastr.success("Company specialist deleted successfully");
            }
            else {
                toastr.error('Error in Delete job');
                console.log(data.message);
            }

        }).error(function (data) {
            console.log(data);
        })
    }

    //*********************************** end specialist  **************************************//


    //********************************* start edit employee ************************************//
    $scope.isEditEmplist = false;

    $scope.getCompanyEmployeelist = function () {
        var params = {
            BusinessID: $scope.BusinessId
        }
        $("#companyProfileEmployeeDiv").block({ message: '<img src="Assets/img/loader.gif" />' });
        $http.get($rootScope.API_PATH + "/Company/GetEmployeeListByBussinessId", { params: params }).success(function (data) {
            $("#companyProfileEmployeeDiv").unblock();
            $scope.objEmplist = data.employeeList;
        }).error(function (data) {

        })

    }

    $scope.addCompanyEmplist = function (obj) {
        console.log(obj);
        var business = {
            FirstName: obj.FirstName,
            MiddleName: obj.MiddleName,
            LastName: obj.LastName,
            IsActive: true,
            insdt: new Date(),
            UserAddressState: obj.State,
            UserEmailAddress: obj.EmailAddress,
            UserPhoneNumber: obj.PhoneNumber,
        }
        var params = {
            BusinessID: $scope.BusinessId
        }
        $http.post($rootScope.API_PATH + "/Company/EmployeeRegister", business, { params: params }).success(function (data) {
            if (data.success == 1) {
                $scope.getCompanyEmployeelist();
                $scope.isAddEmployee = false;
                $scope.initModel();
                toastr.success("employee add successfully");
            }
            else {
                toastr.error("error in addd employee list");
            }

        }).error(function (data) {
            //alert("error");
        });

    }

    $scope.editEMPlist = function (obj) {
        $scope["isEditEmplist_" + obj.UserID] = true;
        $scope.editCompanyEMPlistModel = obj;
        $scope.editCompanyEMPlistModel.UserID = obj.UserID;
    }

    $scope.updateEMPProfile = function (obj) {

        var user = {
            FirstName: obj.FirstName,
            MiddleName: obj.MiddleName,
            LastName: obj.LastName,
            IsActive: true,
            insdt: new Date(),
            UserAddressState: obj.State,
            UserEmailAddress: obj.EmailAddress,
            UserPhoneNumber: obj.PhoneNumber,
            UserID: obj.UserID
        }
        $http.post($rootScope.API_PATH + "/Company/UpdateEmployeeProfile", user).success(function (data) {
            console.log(data);
            if (data.success == 1) {
                $scope.getCompanySpecialist();
                toastr.success("employee profile update successully");
                $scope["isEditEmplist_" + obj.UserID] = false;
                $scope.initModel();
            }
            else {
                toastr.error("error in update employee profile");
            }
        }).error(function (data) {
            //alert("error");
        });

    }

    $scope.cancelEditEMPlist = function (obj) {
        $scope["isEditEmplist_" + obj.UserID] = false;
    }

    $scope.deleteEMPlist = function (id) {
        var params = {
            UserID: id
        }
        $http.get($rootScope.API_PATH + "/Company/DeleteEmployee", { params: params }).success(function (data) {
            if (data.success == 1) {
                toastr.success(data.message);
                $scope.getCompanyEmployeelist();
            }
            else {
                toastr.error("error in delete employee record.")
            }
        }).error(function (data) {
            //alert("error");
        });

    }

    //***********************************end employee  **************************************//


    //********************************* start company achievement ************************************//
    //get 
    $scope.getCompanyAchievelist = function (obj) {
        $("#companyProfileAchieveDiv").block({ message: '<img src="Assets/img/loader.gif" />' });
        $http.get($rootScope.API_PATH + "/Achievements/GetAchievements").success(function (data) {
            $("#companyProfileAchieveDiv").unblock();
            $scope.lstAchievelist = data;
        }).error(function (data) {
            toastr.error("error in get achievement. try again");
        });
    }


    $scope.addCompanyAchievelist = function (obj) {
        if (obj.Name == null || obj.Name == "") {
            toastr.error("enter achievement name");
            return;
        }
        var params = {
            Name: obj.Name,
            BusinessID: $scope.BusinessId
        }
        $("#companyProfileAchieveDiv").block({ message: '<img src="Assets/img/loader.gif" />' });
        $http.post($rootScope.API_PATH + "/Achievements/PostAchievement", params).success(function (data) {
            $("#companyProfileAchieveDiv").unblock();
            toastr.success("Award added successfully");
            $scope.lstAchievelist.push(data);
            $scope.initModel();
            $scope.isAddAwards = false;
        }).error(function (data) {
            toastr.error("error in add achievement. try again");
        });
    }


    $scope.editAchievelist = function (obj) {
        $scope["isEditAchievelist_" + obj.AchievementID] = true;
        $scope.editCompanyAchievelistModel.Name = obj.Name;
        $scope.editCompanyAchievelistModel.AchievementID = obj.AchievementID;
        $scope.editCompanyAchievelistModel.Date = obj.Date;
        //$rootScope.reloadDatePicker();
    }

    //update achievement
    $scope.saveEditAchievelist = function (obj) {
        $scope["isEditAchievelist_" + obj.AchievementID] = false;
        $("#achivementform").hide();
        var params = {
            id: obj.AchievementID,
        }
        var obj = {
            AchievementID: obj.AchievementID,
            BusinessID: $scope.BusinessId,
            Name: obj.Name
        }

        $http.put($rootScope.API_PATH + "/Achievements/PutAchievement", obj, { params: params }).success(function (data) {
            toastr.success("award record update successfully");
            //$scope.getCompanyAchievelist();
            $scope.initModel();
        }).error(function (data) {
            toastr.error("error in update award. try again ");
        })
    }

    $scope.cancelEditAchievelist = function (obj) {
        $scope["isEditAchievelist_" + obj.AchievementID] = false;
    }

    $scope.deleteAchievelist = function (id) {
        var params = {
            id: id
        }
        $http.delete($rootScope.API_PATH + "/Achievements/DeleteAchievement", { params: params }).success(function (data) {
            toastr.success("achievemrnt record delete successfully");
            //$scope.getCompanyAchievelist();
        }).error(function (data) {
            toastr.error("error in delete award. try again");
        });
    }

    //***********************************end achievement  **************************************//


    //********************************* start company location ************************************//
    $scope.getCompanyLocationlist = function () {
        var params = {
            businessID: $scope.BusinessId
        }
        $("#companyProfileLocationDiv").block({ message: '<img src="Assets/img/loader.gif" />' });
        $http.get($rootScope.API_PATH + "/Company/GetBusinessLocation", { params: params }).success(function (data) {
            $("#companyProfileLocationDiv").unblock();
            $scope.lstLocationlist.push(data);
        }).error(function (data) {
            //alert("error");
        });
    }

    $scope.addCompanyLocationlist = function (obj) {
        console.log(obj);
        var params = {
            BusinessID: $scope.BusinessId,
            Line1: obj.Line1,
            Line2: obj.Line2,
            City: obj.City,
            State: obj.State,
            ZipCode: obj.ZipCode
        }

        $http.post($rootScope.API_PATH + "/Addresses/PostAddress", params).success(function (data) {
            toastr.success("location add successfully");
            $scope.initModel();
            $scope.isAddLoaction = false;
        }).error(function (data) {
            toastr.error("error in add company location. try again.")
        });
    }

    $scope.editLocationlist = function (obj) {
        $scope["isEditLocationlist_" + obj.AddressID] = true;
        $scope.editCompanyLocationlistModel = obj;
    }

    $scope.saveEditLocationlist = function (obj) {
        $scope["isEditLocationlist_" + obj.AddressID] = false;
        var objBusiness = {
            BusinessAddressID: obj.BusinessAddressID,
            BusinessID: $scope.BusinessId,
            BusinessAddressLine1: obj.Line1,
            BusinessAddressLine2: obj.Line2,
            BusinessAddressCity: obj.City,
            BusinessAddressState: obj.State,
            BusinessAddressZipCode: obj.ZipCode
        }

        $http.post($rootScope.API_PATH + "/Company/UpdateBusinessLocation", objBusiness).success(function (data) {
            if (data.success == 1) {
                $scope.getCompanyLocationlist();
                toastr.success("location update successfully");
                $scope.initModel();
            }
            else {
                toastr.error("error in add location");
            }

        }).error(function (data) {
            console.log(data);
        });
    }

    $scope.cancelEditLocationlist = function (obj) {
        $scope["isEditLocationlist_" + obj.AddressID] = false;
    }

    $scope.deleteLocationlist = function (id) {
        var params = {
            addressID: id
        }
        $http.get($rootScope.API_PATH + "/Company/DeleteBusinessLocation", { params: params }).success(function (data) {
            if (data.success == 1) {
                toastr.success("location record delete successfully");
                $scope.getCompanyLocationlist();
            }
            else {
                toastr.error("error in delete location record");
            }
        }).error(function (data) {
            console.log(data);
        });
    }

    //*************end location  ****************//

    //for display full description for job
    $scope.displayJobFullDetail = function (id) {
        $scope["fullJobDetail_" + id] = true;
    }
    $scope.init();
});