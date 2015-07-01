'use strict'

angular.module 'qiitenaiApp'
.controller 'PostCtrl', ($scope, $http, $location, $stateParams, User, Auth, ngToast) ->
    $scope.posts = []

    $http.get('/api/posts/me').success (posts) ->
        $scope.posts = posts

    if $stateParams.id
        $http.get '/api/posts/'+$stateParams.id
        .success (post) ->
            $scope.post = post
            $scope.post.user.email_hash = md5 post.user.email
            $scope.rendered = markdown.toHTML $scope.post.markdown
        .error (err) ->
            console.log err

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
            ngToast.success '記事を下書きに移動しました。'
        .error (err) ->
            '操作に失敗しました。しばらく時間をおいてからもう一度試してください。'+err

    $scope.deletePost = (post) ->
        $http.delete '/api/posts/' + post._id
        .success (res) ->
            _.remove $scope.posts, post
            ngToast.danger '記事を削除しました。'
        .error (err) ->
            console.log err
