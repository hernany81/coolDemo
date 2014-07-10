angular.module('ngCoolDemo').controller('MainScreenController', [
            '$scope', '$log', 'CountryService', 'WeatherService', 'TwitterService',
    function($scope,   $log,   CountryService,   WeatherService,   TwitterService) {

        $scope.loading = false;
        $scope.loadingWeather = false;
        $scope.loadingTwitter = false;

        $scope.map = {
            center: {
                latitude: 0,
                longitude: 0
            },
            zoom: 7,
            minimized: false
        };

        $scope.metricsOpt = [
            {
                label: 'Kelvin',
                unit: '°K',
                factor: 0
            },{
                label: 'Celsius',
                unit: '°C',
                factor: -273.15
            }
        ];

        $scope.selectedMetric = $scope.metricsOpt[1];

        $scope.getTemperature = function(value) {
            var result = value + $scope.selectedMetric.factor;

            if(result.toString().indexOf('.') > 0) {
                return result.toFixed(2);
            }

            return result;
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

            var cityName = item.capital + ',' + item.name;

            WeatherService.get({city: cityName}, function(resp){
                $scope.weatherInfo = resp;

                $scope.map.center.latitude = resp.coord.lat;
                $scope.map.center.longitude = resp.coord.lon;

                $scope.loadingWeather = false;
            });

            $scope.loadingTwitter = true;
            TwitterService.get({country: item.name, city: item.capital}, function(resp){
                $scope.twitterInfo = resp;
                $scope.loadingTwitter = false;
            });
        };
    }
]);