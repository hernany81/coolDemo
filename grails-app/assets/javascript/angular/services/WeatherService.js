angular.module('ngCoolDemo.services').factory('WeatherService', [
    '$resource',
    function($resource) {
        return $resource('api/weather');
    }
]);