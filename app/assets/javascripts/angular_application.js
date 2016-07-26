(function() {
	'use strict';

	angular.module('honeycomb', [
        /*
         * Everybody has access to these.
         * We could place these under every feature area,
         * but this is easier to maintain.
         */
         'honeycomb.core',

        /*
         * Feature areas
         */
         'honeycomb.materials',
         'honeycomb.suppliers',


         ]);



	angular.module('honeycomb').run(['$rootScope', '$state', '$http', function($rootScope, $state, $http) {


	}]);

	angular.module('honeycomb').config(['$stateProvider', '$urlRouterProvider', '$httpProvider', function($stateProvider, $urlRouterProvider, $httpProvider) {

		$urlRouterProvider.otherwise("/materials");
		$stateProvider



		.state('materials', {
			url: "/materials",
			templateUrl: "materials/index.html",
			data: {
				pageTitle: 'Materials'
			},
		})
		.state('materials#edit', {
			url: "/materials/:id/edit",
			templateUrl: "materials/edit.html",
			data: {
				pageTitle: 'Edit Material'
			},
		})
		.state('materials#show', {
			url: "/materials/:id",
			templateUrl: "materials/show.html",
			data: {
				pageTitle: 'Material Details'
			},
		})


	}]);

})();
