'use strict'

angular.module 'qiitenaiApp'
.controller 'DraftCtrl', ($scope, $http, $stateParams, $location, User, Auth, Modal) ->

    #TODO: edit用にコントローラ分けたい
    $scope.edit_draft = {}
    $scope.change = ->
        $scope.rendered = markdown.toHTML $scope.edit_draft.markdown
    if $stateParams.id
        $http.get '/api/posts/'+$stateParams.id
        .success (post) ->
            $scope.edit_draft = post
            $scope.rendered = markdown.toHTML $scope.edit_draft.markdown
        .error (err) ->
            console.log err
            
    $scope.message =
        text: ''
        class: ''
    $scope.drafts = []

    $http.get('/api/drafts/me')
    .success (drafts) ->
        $scope.drafts = drafts

    $scope.addDraft = ->
        envelope =
            user: Auth.getCurrentUser()._id
            title: $scope.edit_draft.title
            tags:  $scope.edit_draft.tags
            markdown:  $scope.edit_draft.markdown

        if $scope.edit_draft._id
            $http.put '/api/drafts/'+$scope.edit_draft._id, envelope
            .success ->
                $scope.message =
                    text: '下書きを更新しました。'
                    class: 'alert-success'
        else
            $http.post '/api/drafts/', envelope
            .success ->
                $scope.message =
                    text: '下書きを保存しました。'
                    class: 'alert-success'


    $scope.deleteDraft = (draft) ->
        $http.delete '/api/drafts/' + draft._id
        .success (res) ->
            $scope.message.text = '下書きを削除しました。'
            $scope.message.class = 'alert-danger'
            _.remove $scope.drafts, draft
        .error (err) ->
            console.log err

    $scope.addPost = ->
        envelope =
            user: Auth.getCurrentUser()._id
            title: $scope.edit_draft.title
            tags:  $scope.edit_draft.tags
            markdown:  $scope.edit_draft.markdown
            published: true

        if $scope.edit_draft._id
            $http.put '/api/posts/'+$scope.edit_draft._id, envelope
            .success ->
                $scope.message =
                    text: '記事を更新しました。'
                    class: 'alert-success'
        else
            $http.post '/api/posts/', envelope
            .success ->
                $scope.message =
                    text: '投稿しました。'
                    class: 'alert-success'
