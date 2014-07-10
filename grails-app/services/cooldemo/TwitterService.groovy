package cooldemo

import twitter4j.Twitter
import twitter4j.TwitterFactory
import twitter4j.conf.ConfigurationBuilder

import javax.annotation.PostConstruct

class TwitterService {

    static transactional = false

    def grailsApplication

    Twitter client

    @PostConstruct
    def init() {
        def twitterConf = grailsApplication.config.twitter.default
        ConfigurationBuilder cb = new ConfigurationBuilder();
        twitterConf.each { key, value ->
            cb."$key" = value
        }
        def twitterFactory = new TwitterFactory(cb.build())
        client = twitterFactory.getInstance()
    }
}
