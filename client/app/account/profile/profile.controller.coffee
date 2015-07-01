'use strict'

angular.module 'qiitenaiApp'
.controller 'ProfileCtrl', ($scope, $http, $location, $stateParams, Auth) ->
    $scope.user = {}
    $scope.user_email_hash = ''
    $scope.posts = []
    $scope.message = ''

    $scope.getCurrentUser = Auth.getCurrentUser

    userid = $stateParams.userid or Auth.getCurrentUser()._id
    $http.get '/api/users/'+userid
    .success (user) ->
        $scope.user = user
        $scope.user_email_hash = md5 user.email
    .error (err) ->
        $scope.message = err

    $http.get('/api/posts/u/'+userid)
    .success (posts) ->
        $scope.posts = posts
    .error (err) ->
        $scope.message = err
