'use strict'

angular.module 'qiitenaiApp'
.config ($stateProvider) ->
    $stateProvider
    .state 'login',
        url: '/login'
        templateUrl: 'app/account/login/login.html'
        controller: 'LoginCtrl'

    .state 'signup',
        url: '/signup'
        templateUrl: 'app/account/signup/signup.html'
        controller: 'SignupCtrl'

    .state 'settings',
        url: '/settings'
        templateUrl: 'app/account/settings/settings.html'
        controller: 'SettingsCtrl'
        authenticate: true

    .state 'profile',
        url: '/profile'
        templateUrl: 'app/account/profile/profile.html'
        controller: 'ProfileCtrl'
        authenticate: true
