﻿app.controller('RegisterController', function ($scope, httpService, $http, $location, $rootScope) {
    $scope.init = function () {
        $scope.username = '';
        $scope.firstName = '';
        $scope.middleName = '';
        $scope.lastName = '';
        $scope.password = '';
        $scope.confirmPassword = '';
        $scope.email = '';
        $scope.phone = '';
        $scope.city = '';
        $scope.state = '';
        $scope.zip = '';
        $scope.address = '';
        $scope.howDidYouFindABA = '';
        $scope.whichOfTheSocialMediaUse = '';
        $scope.DOB = '';

    }

    $scope.register = function () {

        if ($scope.password != $scope.confirmPassword) {
            toastr.error("Password and  confirm password not match");
            return;
        }
        var UserDataModel = {
            UserName: $scope.username,
            UserAccountUserName: $scope.username,
            FirstName: $scope.firstName,
            MiddleName: $scope.middleName,
            LastName: $scope.lastName,
            UserEmailAddress: $scope.email,
            UserPhoneNumber: $scope.phone,
            UserAddressLine1: $scope.address,
            UserAddressCity: $scope.city,
            UserAddressState: $scope.state,
            UserAddressZipCode: $scope.zip,
            DOB: $scope.DOB,
            UserAccountPassword: $scope.password,
            HighestLevelOfEducation: $scope.highestLevelOfEducation,
            HowDidYouFindABA: $scope.howDidYouFindABA,
            WhichOfTheSocialMediaUse: $scope.whichOfTheSocialMediaUse,
            IsActive: true,
            IsDeleted: false
        }

        $http.post($rootScope.API_PATH + "/Users/PostUser", UserDataModel).success(function (data,id) {
            console.log(data);

            toastr.success("Thanks for registration.")
            $scope.init();
            httpService.createCookie("uid", data.UserID, 365);
            httpService.createCookie("uname", data.UserEmailAddress, 365);
            $rootScope.loginUserName = httpService.readCookie("uname");
            $rootScope.userId = parseInt(httpService.readCookie("uid"));
            $rootScope.getCompanylist(parseInt(data.UserID));
            $location.path('/personprofile');

        }).error(function (data) {
            toastr.error(JSON.stringify(data));
        });

    }


    //add new are you
    $scope.changeAreYouA = function () {
        if ($scope.areYoua == 'other')
            $scope.isOtherAreYou = true;
        else
            $scope.isOtherAreYou = false;
    }

    //close new areYoua
    $scope.closeAddNewAreYou = function () {
        $scope.isOtherAreYou = false;
        $scope.areYoua = '';
    }

    //add new education
    $scope.changeEducation = function () {
        if ($scope.education == 'other')
            $scope.isOtherEducation = true;
        else
            $scope.isOtherEducation = false;
    }

    //close new education
    $scope.closeAddNewEducation = function () {
        $scope.isOtherEducation = false;
        $scope.education = '';
    }

    //add new refrence
    $scope.changeRefrence = function () {
        if ($scope.refrence == 'other')
            $scope.isOtherRefrence = true;
        else
            $scope.isOtherRefrence = false;
    }

    //close new refrence
    $scope.closeAddNewRefrence = function () {
        $scope.isOtherRefrence = false;
        $scope.refrence = '';
    }
});