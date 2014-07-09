class RestUrlMappings {

    static mappings = {

        "/api/$controller/$action?"(parseRequest: true) {
            action = [POST: 'create', GET: 'index']
        }

    }

}