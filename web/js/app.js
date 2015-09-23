/**
 * Created by Javier on 15/09/2015.
 */
(function () {
    'use strict';
    angular.module('App', ['ngRoute']);

    function config ($locationProvider, $routeProvider) {
        $locationProvider.html5Mode(true);
        $routeProvider
            .when('/', {
                templateUrl: 'view/post-list.tpl.html',
                controller: 'PostListCtrl',
                controllerAs: 'postlist'
            })
            .when('/post/:postId', {
                templateUrl: 'view/post-detail.tpl.html',
                controller: 'PostDetailCtrl',
                controllerAs: 'postdetail'
            })
            .when('/new', {
                templateUrl: 'view/post-create.tpl.html',
                controller: 'PostCreateCtrl',
                controllerAs: 'postcreate'
            });
    }

    angular
        .module('App')
        .config(config);
})();