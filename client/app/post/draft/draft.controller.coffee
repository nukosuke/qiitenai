'use strict'

angular.module 'qiitenaiApp'
.controller 'DraftCtrl', ($scope, $http, $stateParams, $location, User, Auth, Modal) ->

    #TODO: edit用にコントローラ分けたい
    $scope.edit_draft = {}
    if $stateParams.id
        $http.get '/api/posts/'+$stateParams.id
        .success (post) ->
            $scope.edit_draft = post
        .error (err) ->
            console.log err
            
    $scope.message =
        text: ''
        class: ''
    $scope.drafts = []

    $http.get('/api/drafts/')
    .success (drafts) ->
        $scope.drafts = drafts

    $scope.addDraft = ->
        return if $scope.newPost is ''
        $http.post '/api/drafts/',
            title: $scope.newPost.title
            tags:  $scope.newPost.tags
            html:  $scope.newPost.html

    $scope.deleteDraft = (draft) ->
        $http.delete '/api/drafts/' + draft._id
        .success (res) ->
            $scope.message.text = '下書きを削除しました。'
            $scope.message.class = 'alert-danger'
            _.remove $scope.drafts, draft
        .error (err) ->
            console.log err
