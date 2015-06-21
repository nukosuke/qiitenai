'use strict'

angular.module 'qiitenaiApp'
.controller 'MainCtrl', ($scope, $http, Auth) ->
  $scope.feeds = []

  $scope.isLoggedIn = Auth.isLoggedIn
  $scope.getCurrentUser = Auth.getCurrentUser

  $http.get('/api/things').success (feeds) ->
    $scope.feeds = feeds
