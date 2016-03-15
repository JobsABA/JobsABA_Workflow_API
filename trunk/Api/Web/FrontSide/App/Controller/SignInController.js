app.controller('SignInController', function ($scope, $http, httpService, $location, $rootScope) {

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
            Username: 'asdads',
            Password: 'asdadadads',
        }
        $http.post($rootScope.API_PATH + "Account/SignIn", signIn).success(function (data) {

            toastr.success("Login Successfully.");
            httpService.createCookie("uid", data.UserID, 365);
            httpService.createCookie("uname", data.UserEmailAddress, 365);
            //httpService.createCookie("uname", data.userName, 365);
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
    $scope.init();
});