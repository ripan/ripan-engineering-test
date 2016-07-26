(function() {
    'use strict';

    angular.module('honeycomb.materials').controller('MaterialsCtrl', ['$scope', '$stateParams', '$state', 'Material', 'Supplier', function($scope, $stateParams, $state, Material, Supplier) {

        var vm = this;

        vm.index = index;
        vm.show = show;
        vm.update = update;
        vm.suppliers = Supplier.query();

        function index() {
            vm.materials = Material.query();
        };

        function show() {
            vm.material = Material.get({
                id: $stateParams.id
            }, function(response) {
                vm.selectedSupplier = response.supplier
            }, function(errorResponse) {
                alert("Error");
                console.log(errorResponse);
            });
        };

        function update() {

            var data = {
                id: vm.material.id,
                material: vm.material,
            };

            Material.update(data, function(response) {
                $state.go('materials#show', response.material);
            }, function(errorResponse) {
                alert("Error");
                console.log(errorResponse);
            });
        };
    }]);

})();
