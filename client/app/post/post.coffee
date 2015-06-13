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
        templateUrl: 'app/post/draft.html'
        controller: 'PostCtrl'
        authenticate: true
