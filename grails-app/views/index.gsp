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
                <div class="col-lg-8 col-md-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-globe fa-fw"></i> <g:message code="main.map.panel.title"/>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4 col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-info-circle fa-fw"></i> <g:message code="main.detail.panel.title"/>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <g:message code="country.details.name"/>
                                    <span class="pull-right text-muted small">
                                        <em>{{country.name}}</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <g:message code="country.details.capital"/>
                                    <span class="pull-right text-muted small">
                                        <em>{{country.capital}}</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <g:message code="country.details.region"/>
                                    <span class="pull-right text-muted small">
                                        <em data-ng-show="country">{{country.region}} / {{country.subregion}}</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <g:message code="country.details.population"/>
                                    <span class="pull-right text-muted small">
                                        <em>{{country.population}}</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <g:message code="country.details.area"/>
                                    <span class="pull-right text-muted small">
                                        <em>{{country.area}}</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <g:message code="country.details.timezones"/>
                                    <span class="pull-right text-muted small">
                                        <em>{{country.timezones.join(',')}}</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <g:message code="country.details.currencies"/>
                                    <span class="pull-right text-muted small">
                                        <em>{{country.currencies.join(',')}}</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <g:message code="country.details.languages"/>
                                    <span class="pull-right text-muted small">
                                        <em>{{country.languages.join(',')}}</em>
                                    </span>
                                </a>
                            </div>
                            <!-- /.list-group -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
	</body>
</html>
