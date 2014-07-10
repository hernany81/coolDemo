<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
        <title>${meta(name: 'app.name').capitalize()} v<g:meta name="app.version"/></title>
	</head>

	<body>
        <div data-ng-controller="MainScreenController">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><g:message code="main.page.title"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <form role="form" class="form-horizontal normal-padding">
                        <div class="form-group input-group has-feedback">
                            <span class="input-group-addon"><i class="fa fa-search"></i>
                            </span>
                            <input type="text" data-ng-model="countryName" data-typeahead-min-length="3" data-typeahead-loading="loading"
                                   data-typeahead-on-select="selectCountry($item)" data-typeahead-editable="false"
                                   data-typeahead="country.name for country in searchCountry($viewValue)"
                                   class="form-control" placeholder="${message(code: 'main.page.country.lookup.placeholder')}">
                            <span class="fa fa-spinner fa-spin loader form-control-feedback" data-ng-show="loading"></span>
                        </div>
                    </form>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="panel panel-default map">
                        <div class="panel-heading">
                            <i class="fa fa-globe fa-fw"></i> <g:message code="main.map.panel.title"/>
                            <div class="pull-right toggle-btn" data-ng-show="map.minimized" data-ng-click="map.minimized = false">
                                <span class="fa fa-toggle-down"></span>
                            </div>
                            <div class="pull-right toggle-btn" data-ng-show="!map.minimized" data-ng-click="map.minimized = true">
                                <span class="fa fa-toggle-up"></span>
                            </div>
                            <div class="pull-right" data-ng-show="loadingWeather">
                                <span class="fa fa-spinner fa-spin loader"></span>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body map" data-ng-show="!map.minimized">
                            <data-google-map center="map.center" zoom="map.zoom" draggable="true"></data-google-map>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <g:render template="/common/countryDetailPanel"/>
                </div>
                <div class="col-lg-4 col-md-4">
                    <g:render template="/common/weatherDetailPanel"/>
                </div>
                <div class="col-lg-4 col-md-4">
                    <g:render template="/common/twitterDetailPanel"/>
                </div>
            </div>
        </div>
	</body>
</html>
