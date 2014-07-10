CoolDemo
========

This is a simple demo application to demonstrate the use and integration of several REST APIs, it's built on:
- Grails 2.3.8
- Twitter Bootstrap Theme
- Angular JS

These are the REST APIs used by the application:
- http://restcountries.eu/
- http://openweathermap.org/
- Google Maps
- Twitter

Design decisions:
=================

Client Integration:
-------------------

To get information from http://restcountries.eu/ REST API I made use of Angular resource feature to make direct calls to the API from browser.
To integrate google maps into the App I used an Angular Google Map directive.

Server Integration:
-------------------

For the other services (openweathermap & twitter) there is a need to use API keys, so to avoid exposing these keys to client side I made the integration on the backend.
Additionally some logic was needed to retrieve trending tweets as sometimes there is no info for some cities and when this happens I retrieve trending tweets from the country.