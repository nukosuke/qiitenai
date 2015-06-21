'use strict'

angular.module 'qiitenaiApp'
.config ($stateProvider) ->
    $stateProvider
    .state 'main',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainCtrl'
