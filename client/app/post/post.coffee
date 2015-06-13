'use strict'

angular.module 'qiitenaiApp'
.config ($stateProvider) ->
    $stateProvider
    .state 'post',
        url: '/post'
        templateUrl: 'app/post/post.html'
        controller: 'PostCtrl'
        
    .state 'draft',
        url: '/draft'
        templateUrl: 'app/post/draft/draft.html'
        controller: 'DraftCtrl'
        #authenticate: true

    .state 'editor',
        url: '/draft/edit'
        templateUrl: 'app/post/draft/editor.html'
        controller: 'DraftCtrl'
        #authenticate: true
