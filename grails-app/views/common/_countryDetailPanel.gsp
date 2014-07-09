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
                    <em>{{country.population | number}}</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <g:message code="country.details.area"/>
                <span class="pull-right text-muted small">
                    <em data-ng-show="country">{{country.area | number}} km²</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <g:message code="country.details.timezones"/>
                <span class="pull-right text-muted small">
                    <em>{{country.timezones.join(', ')}}</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <g:message code="country.details.currencies"/>
                <span class="pull-right text-muted small">
                    <em>{{country.currencies.join(', ')}}</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <g:message code="country.details.languages"/>
                <span class="pull-right text-muted small">
                    <em>{{country.languages.join(', ')}}</em>
                </span>
            </a>
        </div>
        <!-- /.list-group -->
    </div>
    <!-- /.panel-body -->
</div>
<!-- /.panel -->