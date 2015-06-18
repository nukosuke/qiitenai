'use strict'

angular.module 'qiitenaiApp'
.controller 'PostCtrl', ($scope, $http, $location, User, Auth) ->
    $scope.message =
        text: ''
        class: ''
    $scope.posts = []

    $http.get('/api/posts').success (posts) ->
        $scope.posts = posts

    $scope.addPost = ->
        return if $scope.newPost.title is '' and $scope.newPost.html is ''
        $http.post '/api/posts',
            title: $scope.newPost.title
            tags:  $scope.newPost.tags
            html:  $scope.newPost.html
        .success (res) ->
            $location.path '/'+User.get().name+'/'
        .error (err) ->
            $scope.message = '投稿に失敗しました。しばらく時間をおいてからもう一度試してください。'+err

    $scope.moveToDraft = (post) ->
        post.published = false
        $http.put '/api/posts', post
        .success (res) ->
            $scope.message =
                text: '記事を下書きに移動しました。'
                class: 'alert-success'
        .error (err) ->
            '操作に失敗しました。しばらく時間をおいてからもう一度試してください。'+err

    $scope.deletePost = (post) ->
        $http.delete '/api/posts/' + post._id
        .success (res) ->
            _.remove $scope.posts, post
            $scope.message =
                text: '記事を削除しました。'
                class: 'alert-danger'
        .error (err) ->
            console.log err
