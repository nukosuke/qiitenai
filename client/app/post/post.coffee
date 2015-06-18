'use strict'

angular.module 'qiitenaiApp'
.config ($stateProvider) ->
    $stateProvider
    .state 'post',
        url: '/posts'
        templateUrl: 'app/post/post.html'
        controller: 'PostCtrl'
        
    .state 'draft',
        url: '/drafts'
        templateUrl: 'app/post/draft/draft.html'
        controller: 'DraftCtrl'
        #authenticate: true

    .state 'editor',
        url: '/drafts/edit'
        templateUrl: 'app/post/draft/editor.html'
        controller: 'DraftCtrl'
        #authenticate: true
