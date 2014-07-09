package cooldemo

import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import org.codehaus.groovy.grails.commons.GrailsApplication

class WeatherController {

    GrailsApplication grailsApplication

    RestBuilder rest

    def index(String city) {
        RestResponse restResponse = rest.get("http://api.openweathermap.org/data/2.5/weather?q=$city") {
            header('x-api-key', grailsApplication.config.grails.openweathermap.api)
        }

        render(restResponse.json as JSON)
    }
}
