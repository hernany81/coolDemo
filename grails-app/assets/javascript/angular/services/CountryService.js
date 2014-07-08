angular.module('ngCoolDemo.services').factory('CountryService', [
    '$resource',
    function($resource) {
        return $resource('http://restcountries.eu/rest/v1/name/:country');
    }
]);