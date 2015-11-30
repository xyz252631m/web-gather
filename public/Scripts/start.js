require.config({
    baseUrl: '/Scripts/',
    paths: {
        jquery: 'jquery-1.10.2.min',
        angular: 'require/angular',
        domReady: 'require/domReady',
        alertBox: 'require/alertBox',
        angular: "angular/angular.min",
        'angular-route': 'angular/angular-route.min'
    },
    shim: {
        'alertBox': {
            deps: ['jquery'],
            exports: '$.alertBox'
        },
        'angular': {
            deps: ['jquery'],
            exports: "angular"
        },
        'angular-route': {
            exports: "angular-route",
            deps: ["angular"]
        }

    }
});
