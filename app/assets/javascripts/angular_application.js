(function() {
	'use strict';

	angular.module('honeycomb', [
        /*
         * Order is not important. Angular makes a
         * pass to register all of the modules listed
         * and then when app.dashboard tries to use app.data,
         * its components are available.
         */

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


         ]);



	angular.module('honeycomb').run(['$rootScope', '$state', '$http', function($rootScope, $state, $http) {


	}]);

	angular.module('honeycomb').config(['$stateProvider', '$urlRouterProvider', '$httpProvider', function($stateProvider, $urlRouterProvider, $httpProvider) {

		$urlRouterProvider.otherwise("/materials");
		$stateProvider



		.state('materials', {
			url: "/materials",
			templateUrl: "assets/modules/materials/templates/index.html",
			data: {
				pageTitle: 'Materials'
			},
		})
		.state('materials#new', {
			url: "/materials/new",
			templateUrl: "/assets/modules/materials/templates/new.html",
			data: {
				pageTitle: 'New Material'
			},
		})
		.state('materials#edit', {
			url: "/materials/:id/edit",
			templateUrl: "/assets/modules/materials/templates/edit.html",
			data: {
				pageTitle: 'Edit Material'
			},
		})
		.state('materials#show', {
			url: "/materials/:id",
			templateUrl: "/assets/modules/materials/templates/show.html",
			data: {
				pageTitle: 'Material Details'
			},
		})


	}]);

})();
