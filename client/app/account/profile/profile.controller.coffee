'use strict'

angular.module 'qiitenaiApp'
.controller 'ProfileCtrl', ($scope, $http, $location, Auth) ->
    $scope.posts = []
    $scope.message = ''

    $scope.getCurrentUser = Auth.getCurrentUser

    $scope.user_email_hash = md5 $scope.getCurrentUser().email

    $http.get('/api/posts/me')
    .success (posts) ->
        $scope.posts = posts
    .error (err) ->
        $scope.message = err
