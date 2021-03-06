﻿app.controller('SignInController', function ($scope, $http, httpService, $location, $rootScope) {

    $scope.init = function () {
        //$scope.username = '';
        //$scope.password = '';
        $scope.prePath = $rootScope.previousPath;
        $scope.prePathParam = $rootScope.previousPathParam;
    }

    $scope.login = function () {

        if ($scope.username.length == 0 || $scope.password.length == 0) {
            toastr.error("Enter username and password.");
            return;
        }
        var signIn = {
            Username: $scope.username,
            Password: $scope.password,
        }
        $http.post($rootScope.API_PATH + "Account/SignIn", signIn).success(function (data) {
            toastr.success("Login Successfully.");

            if ($scope.isRemember) {
                httpService.createCookie("uid", data.UserID, 365);
                httpService.createCookie("uname", data.UserEmailAddress, 365);
            }
            else {
                httpService.createCookie("uid", data.UserID);
                httpService.createCookie("uname", data.UserEmailAddress);
            }
            $rootScope.loginUserName = httpService.readCookie("uname");
            $rootScope.userId = parseInt(httpService.readCookie("uid"));
            $rootScope.UserLogin = true;
            $rootScope.getCompanylist(parseInt(data.UserID));
            if ($scope.prePath == "/jobsInAba")
                $location.path('/jobsInAba');
            else if ($scope.prePath == "/viewcompanyprofile/:BusinessId")
                $location.path('/viewcompanyprofile/' + $scope.prePathParam);
            else if ($scope.prePath == "/home")
                $location.path('/home');
            else
                $location.path('/personprofile');
        }).error(function (data) {
            toastr.error("error in login. try again");
        })

    }

    //forgot password
    $scope.ForgotPassword = function () {
        var forgotEmail = {
            ForgotEmailAddress: $scope.forgotPasswordLink
        }
        $http.post($rootScope.API_PATH + "Account/ForgotPassword", forgotEmail).success(function (data) {
            toastr.success("password reset link send to you mail address.");
        }).error(function (data) {
            toastr.error("error in send forgot password link. try again");
        });
    }

    $scope.init();
});