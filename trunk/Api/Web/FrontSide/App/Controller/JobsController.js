app.controller('JobsController', function ($scope, httpService, $http, $routeParams, $rootScope, $filter) {
    $scope.init = function () {
        $scope.initModel();
        $scope.jobId = parseInt($routeParams.JobID);
        if ($scope.jobId != undefined)
            $scope.getJobDetailById($scope.jobId);
        $scope.randomNumber = Math.random();
        $rootScope.reloadDatePicker();
    }

    $scope.initModel = function () {
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
        $scope.isEditMode = false;
    }


    //for job detail page
    $scope.getJobDetailById = function (id) {
        var params = {
            id: id
        }
        $("#jobDetailMain").block({ message: '<img src="Assets/img/loader.gif" />' });
        $http.get($rootScope.API_PATH + "/Jobs/GetJob/", { params: params }).then(function (data) {
            console.log(data);
            if (data.data.StartDate != null) {
                data.data.StartDate = $rootScope.setDateformat(data.data.StartDate);
            }
            if (data.data.EndDate != null) {
                data.data.EndDate = $rootScope.setDateformat(data.data.EndDate);
            }
            $scope.ImageExtension = '';
            if (data.data.Business != null && data.data.Business != "" && data.data.Business.BusinessImages != undefined && data.data.Business.BusinessImages.length > 0) {
                for (var j = 0; j < data.data.Business.BusinessImages.length; j++) {
                    if (data.data.Business.BusinessImages[j].IsPrimary == true) {
                        $scope.ImageExtension = data.data.Business.BusinessImages[j].Image.ImageExtension;
                    }
                }
            }
            $scope.objJobDetail = data.data;
            $("#jobDetailMain").unblock();
        }, function (data) {
            $("#jobDetailMain").unblock();
        });
    }

    //Job Create


    $scope.init();

});