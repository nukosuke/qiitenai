'use strict'

angular.module 'qiitenaiApp'
.controller 'MainCtrl', ($scope, $location, $http, Auth, $window) ->
  $scope.feeds = []

  $scope.isLoggedIn = Auth.isLoggedIn
  $scope.getCurrentUser = Auth.getCurrentUser

  $scope.user = {}
  $scope.errors = {}

  if $scope.isLoggedIn()
    $scope.user_email_hash = md5 Auth.getCurrentUser().email

  $scope.login = (form) ->
    $scope.submitted = true

    if form.$valid
      # Logged in, redirect to home
      Auth.login
        email: $scope.user.email
        password: $scope.user.password

      .then ->
        $scope.user_email_hash = md5 $scope.user.email
        $location.path '/'

      .catch (err) ->
        $scope.errors.other = err.message

  $scope.loginOauth = (provider) ->
    $window.location.href = '/auth/' + provider


  $http.get('/api/posts/').success (feeds) ->
    $scope.feeds = feeds
