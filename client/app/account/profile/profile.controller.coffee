'use strict'

angular.module 'qiitenaiApp'
.controller 'ProfileCtrl', ($scope, $http, $location, Auth) ->
    $scope.message = ''

    $scope.getCurrentUser = Auth.getCurrentUser
