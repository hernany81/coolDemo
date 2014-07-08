<!DOCTYPE html>
<html lang="en" data-ng-app="ngCoolDemo">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title><g:layoutTitle default="${message(code: 'default.app.page.title')}"/></title>

        <asset:stylesheet href="main.css"/>

        <g:layoutHead/>

    </head>

    <body class="${params.controller} ${params.action ? params.controller + '-' + params.action : ''} ng-cloak"
          data-ng-controller="ApplicationController">

        <div id="wrapper">

            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">${meta(name: 'app.name').capitalize()} v<g:meta name="app.version"/></a>
                </div>
                <!-- /.navbar-header -->
            </nav>

            <div id="page-wrapper">
                <g:layoutBody/>
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <asset:javascript src="main.js"/>

    </body>

</html>