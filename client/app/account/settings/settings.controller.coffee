'use strict'

angular.module 'qiitenaiApp'
.controller 'SettingsCtrl', ($scope, User, Auth) ->
  $scope.errors = {}
  
  $scope.getCurrentUser = Auth.getCurrentUser

  $scope.changePassword = (form) ->
    $scope.submitted = true

    if form.$valid
      Auth.changePassword $scope.user.oldPassword, $scope.user.newPassword
      .then ->
        $scope.message = 'パスワードは正常に変更されました。'

      .catch ->
        form.password.$setValidity 'mongoose', false
        $scope.errors.other = 'Incorrect password'
        $scope.message = ''
