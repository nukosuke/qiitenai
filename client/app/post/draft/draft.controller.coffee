'use strict'

angular.module 'qiitenaiApp'
.controller 'DraftCtrl', ($scope, $http, $location, User, Auth, Modal) ->
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
