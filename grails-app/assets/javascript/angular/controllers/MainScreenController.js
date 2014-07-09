angular.module('ngCoolDemo').controller('MainScreenController', [
            '$scope', '$log', 'CountryService', 'WeatherService',
    function($scope,   $log,   CountryService,   WeatherService) {

        $scope.loading = false;
        $scope.loadingWeather = false;

        $scope.map = {
            center: {
                latitude: 0,
                longitude: 0
            },
            zoom: 7,
            minimized: false
        };

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

            $scope.loadingWeather = true;
            WeatherService.get({city: item.capital + ',' + item.name}, function(resp){
                $scope.weatherInfo = resp;

                $scope.map.center.latitude = resp.coord.lat;
                $scope.map.center.longitude = resp.coord.lon;

                $scope.loadingWeather = false;
            });
        };
    }
]);