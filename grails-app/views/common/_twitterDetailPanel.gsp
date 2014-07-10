<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-twitter fa-fw"></i> <g:message code="main.twitter.trending.topics.panel.title"/>
        <div class="pull-right" data-ng-show="loadingTwitter">
            <span class="fa fa-spinner fa-spin loader"></span>
        </div>
        <div class="pull-right" data-ng-show="twitterInfo && twitterInfo.success" data-tooltip="{{twitterInfo.rateLimit.message}}" data-tooltip-placement="left">
            <span class="fa fa-info-circle"></span>
        </div>
        <div class="pull-right" data-ng-show="twitterInfo && !twitterInfo.success" data-tooltip="{{twitterInfo.error.message}}" data-tooltip-placement="left">
            <span class="fa fa-warning"></span>
        </div>
    </div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        <div class="list-group">
            <a data-ng-href="{{tweet.url}}" target="_blank" class="list-group-item" data-ng-repeat="tweet in twitterInfo.trends">
                {{tweet.name}}
            </a>
        </div>
        <!-- /.list-group -->
    </div>
    <!-- /.panel-body -->
</div>
<!-- /.panel -->