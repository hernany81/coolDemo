angular.module('ngCoolDemo').controller('ApplicationController', [
            '$scope', '$log', '$timeout',
    function($scope,   $log,   $timeout) {

        $scope.globalMessages = [];
        $scope.globalMessagesType = null;

        var addMessages = function(type, messages) {
            $scope.globalMessages.splice(0, $scope.globalMessages.length);
            $scope.globalMessagesType = type;

            angular.forEach(messages, function(msg) {
                $scope.globalMessages.push(msg);
            });

            $timeout(function() {
                $scope.globalMessages.splice(0, $scope.globalMessages.length);
            }, 5000);
        };

        $scope.$on('ap:response:error', function(ev, response) {
            addMessages('error', ['Error while performing AJAX call']);
        });
    }
]);