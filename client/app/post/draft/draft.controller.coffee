'use strict'

angular.module 'qiitenaiApp'
.controller 'DraftCtrl', ($scope, $http, $location, User, Auth) ->
    $scope.message = ''
    $scope.drafts = []

    $http.get('/api/posts/')#+User.get().id)
    .success (drafts) ->
        $scope.drafts = drafts

    $scope.addDraft = ->
        return if $scope.newPost is ''
        $http.post '/api/post',
            title: $scope.newPost.title
            tags:  $scope.newPost.tags
            html:  $scope.newPost.html

    $scope.deleteDraft = (draft) ->
        $http.delete '/api/posts'+draft._id
