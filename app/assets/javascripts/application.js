// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require angular/angular
//= require angular-route/angular-route
//= require angular-ui-router/release/angular-ui-router
//= require angular-resource/angular-resource
//= require angular-animate
//= require angular-mocks
//= require angular-bootstrap
//= require angular-rails-templates

//= require modules/core/core.module.js

//= require modules/materials/materialsModule.js
//= require modules/materials/materialsDirective.js
//= require modules/materials/materialsFactory.js
//= require modules/materials/materialsController.js
//= require modules/materials/materialsTests.js

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

		$urlRouterProvider.otherwise("/home");
		$stateProvider

		.state('home', {
			url: "/home",
			templateUrl: "home/index.html"
		})

		.state('materials', {
			url: "/materials",
			templateUrl: "materials/index.html",
			data: {
				pageTitle: 'Materials'
			},
		})
		.state('materials#new', {
			url: "/materials/new",
			templateUrl: "materials/new.html",
			data: {
				pageTitle: 'New Material'
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
