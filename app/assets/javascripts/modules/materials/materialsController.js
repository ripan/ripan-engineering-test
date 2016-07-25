(function() {
    'use strict';

    angular.module('honeycomb.materials').controller('MaterialsCtrl', ['$scope', 'Material', function($scope, Material) {
debugger;
        var vm = this;

        vm.index = index;
        vm.show = show;
        vm.create = create;
        vm.update = update;
        vm.destroy = destroy;

        function index() {
            alert('hi')
            vm.materials = Material.query();
        };

        function show() {
        	alert('sdfds');
            vm.material = Material.get({
                id: $stateParams.id
            });
        };

        function create() {

            var attr = {
                material: vm.material,
                user: vm.user,
                address: vm.address
            }

            Material.create(attr, function(response) {
                $state.go('materials#show', response.material);
            }, function(errorResponse) {
                vm.error = errorResponse.data.message;
            });
        };

        function destroy(material) {
            Material.delete(material, function() {
                debugger;
                for (var i in vm.materials) {
                    if (vm.materials[i] === material) {
                        vm.materials.splice(i, 1);
                    }
                }
                $state.go('materials');
            });
        };

        function update() {

            var attr = {
                id: vm.material.id,
                material: vm.material,
                user: vm.user,
                address: vm.address
            }

            Material.update(attr, function(response) {
                $state.go('materials#show', response.material);
            }, function(errorResponse) {
                vm.error = errorResponse.data.message;
            });
        };
    }]);

})();
