angular.module('ngCoolDemo').controller('MainScreenController', [
            '$scope', '$log', 'CountryService',
    function($scope,   $log,   CountryService) {

        $scope.loading = false;

        $scope.searchCountry = function(countryName) {
            $log.debug('Searching for: ' + countryName);

            if(!countryName || angular.isObject(countryName)) {
                return [];
            }

            $scope.loading = true;

            return CountryService.query({country: countryName}).$promise.then(function(resp) {
                $scope.loading = false;
                return resp;
            });
        };

        $scope.selectCountry = function(item) {
            $scope.country = item;
        };
    }
]);