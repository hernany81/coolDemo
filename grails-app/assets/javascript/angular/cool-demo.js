'use strict';

// Create services / directives / filters
angular.module('ngCoolDemo.services', ['ngResource', 'ngSanitize']);
angular.module('ngCoolDemo.directives', []);
angular.module('ngCoolDemo.filters', []);

// Create our namespace if it doesn't exist
if (!window.ngCoolDemo) {
    window.ngCoolDemo = {debugEnabled: true};
}

// Angular
window.ngCoolDemo.ng = angular.module('ngCoolDemo', [
        'ngCoolDemo.directives',
        'ngCoolDemo.filters',
        'ngCoolDemo.services',
        'ngAnimate',
        'mgcrea.ngStrap.typeahead'
    ])
    .config(['$locationProvider', '$logProvider', '$httpProvider', '$provide', function($locationProvider, $logProvider, $httpProvider, $provide) {

        // Config logging
        if (window.ngCoolDemo && window.ngCoolDemo.debugEnabled) {
            $logProvider.debugEnabled(true);
        } else {
            $logProvider.debugEnabled(false);
        }

        $locationProvider.html5Mode(true);
        // The prefix is required for older browser in hashbang mode, it allows to differentiate the route (#!) from an
        // actual HTML anchor (#).
        $locationProvider.hashPrefix = '!';

        $provide.factory('DefaultHttpInterceptor', function($q, $rootScope) {
            return {
                'request': function(config) {
                    $rootScope.$broadcast('ap:request:start', config);
                    return config || $q.when(config);
                },
                'response': function(response) {
                    $rootScope.$broadcast('ap:response:success', response);
                    return response || $q.when(response);
                },
                'responseError': function(response) {
                    $rootScope.$broadcast('ap:response:error', response);
                    return $q.reject(response);
                }
            }
        });

        $httpProvider.interceptors.push('DefaultHttpInterceptor');
        $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
    }]
);