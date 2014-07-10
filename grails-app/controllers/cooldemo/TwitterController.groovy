package cooldemo

import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import org.codehaus.groovy.grails.commons.GrailsApplication
import org.codehaus.groovy.grails.web.json.JSONObject
import twitter4j.Trends
import twitter4j.TwitterException

class TwitterController {

    GrailsApplication grailsApplication

    RestBuilder rest

    TwitterService twitterService

    private Trends retrieveTrends(String place) throws TwitterException {
        RestResponse restResponse = rest.get("http://where.yahooapis.com/v1/places.q('${place.encodeAsURL()}')?appid=[${grailsApplication.config.grails.yahoo.api}]&format=JSON")

        JSONObject jsonResponse = restResponse.json as JSONObject
        JSONObject jsonPlace = jsonResponse.getJSONObject('places').getJSONArray('place').get(0) as JSONObject
        int woeid = jsonPlace.getInt('woeid')

        twitterService.client.getPlaceTrends(woeid)
    }

    def index(String country, String city) {
        // Look for the place WOEID from Yahoo services
        String place = country + ',' + city

        def successRendererClosure = {Trends trends ->
            render ([
                success: true,
                trends: trends.trends.collect {[
                    name: it.name,
                    url: it.URL
                ]},
                location: [
                    countryCode: trends.location.countryCode,
                    countryName: trends.location.countryName,
                    placeCode: trends.location.placeCode,
                    placeName: trends.location.placeName,
                    name: trends.location.name,
                    woeid: trends.location.woeid
                ],
                rateLimit: [
                    exceededRateLimit: false,
                    limit: trends.rateLimitStatus.limit,
                    remaining: trends.rateLimitStatus.remaining,
                    secondsUntilReset: trends.rateLimitStatus.secondsUntilReset,
                    message: message(code: 'twitter.rate.limit.info', args: [trends.rateLimitStatus.limit, trends.rateLimitStatus.remaining, trends.rateLimitStatus.secondsUntilReset])
                ]
            ] as JSON)
        }

        def errorRendererClosure = {TwitterException ex ->
            render ([
                success: false,
                rateLimit: [
                    exceededRateLimit: ex.exceededRateLimitation(),
                    limit: ex.rateLimitStatus.limit,
                    remaining: ex.rateLimitStatus.remaining,
                    secondsUntilReset: ex.rateLimitStatus.secondsUntilReset,
                    message: ex.exceededRateLimitation() ? message(code: 'twitter.error.rate.exceeded', args: [ex.rateLimitStatus.secondsUntilReset]) : ''
                ],
                error: [
                    retryAfter: ex.retryAfter,
                    errorCode: ex.errorCode,
                    errorMessage: ex.errorMessage,
                    message: ex.exceededRateLimitation() ? message(code: 'twitter.error.rate.exceeded', args: [ex.rateLimitStatus.secondsUntilReset]) : message(code: 'twitter.error.no.info')
                ]
            ] as JSON)
        }

        successRendererClosure.delegate = this
        errorRendererClosure.delegate = this

        try {
            Trends trends = retrieveTrends(place)

            successRendererClosure(trends)
        } catch(TwitterException ex) {
            // This error can be caused because there is no twitter info for the city, try to get tweets just for the country

            if(ex.exceededRateLimitation()) {
                errorRendererClosure(ex)
            } else {
                try {
                    Trends trends = retrieveTrends(country)

                    successRendererClosure(trends)
                } catch (TwitterException ex1) {
                    errorRendererClosure(ex1)
                }
            }
        }

    }
}
