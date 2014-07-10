<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-sun-o fa-fw"></i> <g:message code="main.weather.panel.title"/>
        <div class="pull-right" data-ng-show="loadingWeather">
            <span class="fa fa-spinner fa-spin loader"></span>
        </div>
    </div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        <div class="list-group">
            <div class="list-group-item">
                <div class="row">
                    <div data-ng-if="weatherInfo" class="col-md-6">
                        <img data-ng-src="http://openweathermap.org/img/w/{{weatherInfo.weather[0].icon}}.png">
                        <em>{{weatherInfo.weather[0].description}}</em>
                    </div>
                    <div class="col-md-offset-6 col-md-6">
                        <select class="form-control" data-ng-model="selectedMetric" data-ng-options="item.label for item in metricsOpt"></select>
                    </div>
                </div>
            </div>
            <a href="#" class="list-group-item">
                <g:message code="weather.details.wind.speed"/>
                <span class="pull-right text-muted small">
                    <em data-ng-show="weatherInfo">{{weatherInfo.wind.speed}} mps</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <g:message code="weather.details.humidity"/>
                <span class="pull-right text-muted small">
                    <em data-ng-show="weatherInfo">{{weatherInfo.main.humidity}} %</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <g:message code="weather.details.pressure"/>
                <span class="pull-right text-muted small">
                    <em data-ng-show="weatherInfo">{{weatherInfo.main.pressure}} hPa</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <g:message code="weather.details.temp"/>
                <span class="pull-right text-muted small">
                    <em data-ng-show="weatherInfo">{{getTemperature(weatherInfo.main.temp)}} {{selectedMetric.unit}}</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <g:message code="weather.details.min.temp"/>
                <span class="pull-right text-muted small">
                    <em data-ng-show="weatherInfo">{{getTemperature(weatherInfo.main.temp_min)}} {{selectedMetric.unit}}</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <g:message code="weather.details.max.temp"/>
                <span class="pull-right text-muted small">
                    <em data-ng-show="weatherInfo">{{getTemperature(weatherInfo.main.temp_max)}} {{selectedMetric.unit}}</em>
                </span>
            </a>
        </div>
        <!-- /.list-group -->
    </div>
    <!-- /.panel-body -->
</div>
<!-- /.panel -->