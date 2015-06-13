'use strict'

angular.module 'qiitenaiApp'
.config ($stateProvider) ->
  $stateProvider.state 'post',
    url: '/post'
    templateUrl: 'app/post/post.html'
    controller: 'PostCtrl'
