app.controller('CreatePasswordController', function ($scope, $location, httpService, $rootScope, $http, $filter) {

    $scope.ChangePassword = function () {
        var params = {
            currentPassword: $scope.currentPassword,
            newPassword: $scope.newPassword,
            ConfirmPassword: $scope.ConfirmPassword
        }

        $http.get($rootScope.API_PATH + "/User/CreatePassword", { params: params }).success(function (data) {
            toastr.success("password change successfully");
            $location.path('/personprofile');
        }).error(function (data) {
            toastr.error("error in change password");
        });
    }


});