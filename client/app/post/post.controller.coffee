'use strict'

angular.module 'qiitenaiApp'
.controller 'PostCtrl', ($scope, $http, $location, User, Auth) ->
    $scope.message = ''
    $scope.posts = []

    $http.get('/api/posts').success (posts) ->
        $scope.posts = posts

    $scope.addPost = ->
        return if $scope.newPost.title is '' and $scope.newPost.html is ''
        $http.post '/api/posts',
            title: $scope.newPost.title
            html:  $scope.newPost.html
        $location.path '/'

    $scope.addDraft = ->
        return if $scope.newPost is ''
        $http.post '/api/drafts',
            title: $scope.newPost.title
            html:  $scope.newPost.html

    $scope.deletePost = (post) ->
        $http.delete '/api/posts/' + post._id
