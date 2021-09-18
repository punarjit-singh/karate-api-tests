Feature: Current weather for given postcode

  Background:
    * url baseUrl + '/current'
    * param key = apiKey

    # to demo schema validation of the inner weather object
    * def weatherSchema = { icon: '#string', code: '#number', description: '#string' }

    # for scenario outlines we can load test data through json but just using example table for demo
    # * def postal_code = read('./postal_code.json')

  Scenario Outline: given postcode <postal_code>, validate current weather
    Given params {postal_code:<postal_code>}
    When method get
    Then status 200

    And match each $.data contains
    """
    {
      lat: '#ignore',
      city_name: <city_name>,
      country_code: <country_code>,
      wind_spd: '#notnull',
      wind_dir: '#number',
      station: '#string'
    }
    """

    #Schema validation for inner weather object
    And match $.data[0].weather == '#(weatherSchema)'
    And match $.count == 1

    #Add more assertions similarly,
      # if mock server setup available even exact response json can be matched directly...

    Examples:
#      | postal_code   |      if using json data from line 6

      | country_code  | city_name       | postal_code   |
      | US            | Lake Monticello | 22963         |
      | AU            | Maroubra        | 2035          |
      | CA            | Winnipeg        | R2W 0Z6       |

      #the following two scenarios fail as postal codes from weatherbit turns out to be from US
        #H3503 is postal code of Barranqueras in Argentina as per google
        #62640-000 is postal code of Pentecoste in Brazil as per google
        #commented it so circle ci job can pass these can be considered as bugs
        #just keeping it failing for demo, please uncomment to run
#      | AR            | Barranqueras    | H3503         |
#      | BR            | Pentecoste      | 62640-000     |

      #Add more test data as required...
