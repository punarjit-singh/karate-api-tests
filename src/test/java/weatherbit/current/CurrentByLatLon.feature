Feature: Current weather for given latitude and longitude

  Background:
    * url baseUrl + '/current'
    * param key = apiKey

  Scenario Outline: given lat:<lat> and lon:<lon>, validate current weather
    Given params {lat:<lat>, lon:<lon>}
    When method get
    Then status 200

    #Demonstrating different kinds of assertions...

    And match $.data[0].lon == <lon>
    And match each $.data contains { lat: <lat>, city_name: <city_name>, country_code: <country_code> }
    And match each $.data contains { wind_spd: '#notnull', wind_dir: '#number', sunrise: '#regex ^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$' }
    And match $.data[0].weather contains { icon: '#notnull', code: '#number', description: '#string', rh: '#ignore' }
    And match $.count == 1

    #Add more assertions similarly,
      # if mock server setup available even exact response json can be matched directly...

    Examples:
      | country_code  | city_name       | lat     | lon     |
      | US            | Lake Monticello | 38      | -78.25  |
      | AR            | Barranqueras    | -27.48  | -58.94  |
      | AU            | Maroubra        | -33.95  | 151.23  |
      | BR            | Pentecoste      | -3.79   | -39.27  |
      | CA            | Winnipeg        | 49.88   | -97.14  |
      #Add more test data as required...
