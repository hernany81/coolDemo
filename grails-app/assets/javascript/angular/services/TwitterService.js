angular.module('ngCoolDemo.services').factory('TwitterService', [
    '$resource',
    function($resource) {
        return $resource('api/twitter');
    }
]);