[![Weather-Bit](https://circleci.com/gh/punarjit-singh/weatherbit-api-tests.svg?style=svg)](https://app.circleci.com/pipelines/github/punarjit-singh/weatherbit-api-tests)

## Running the tests:
    mvn test -Dkarate.env=prod      #run all prod weatherbit tests in parallel
    mvn test -Dtest=WeatherBitTest  #run all weatherbit tests in parallel for default env
    mvn test -Dtest=CurrentRunner   #run only /current weather tests (for local dev)
    

## Folder Structure
Note: The folder structure is kept simpler on purpose based on an assumption that these tests will sit outside of actual app code, hence the `com.mycompany.foo.bar` convention and the addition of conventional sub-folders isn't done. The folder hierarchy is only one or two levels deep for demo purposes - where the folder names identify the API under test.

    - ~/src/test/java
        - weatherbit
            - current (matching the endpoint /current)
                - feature files
                - individual feature runner
            - runner for all features
        - karate-config.js
    - ~/.circleci
        - config.yml
    - pom.xml
    - README.md

If tests need to sit inside the app codebase, we can use the conventional java folder structure.

### Sample Report
![Karate Reports](/karate-report-sample.png)

### CircleCI
Basic circle ci config has been setup for this project but it can be extented to excute custom commands via the `circleci/maven@1.2.0` orb or custom configuration using docker executors. 

![CircleCI Sample Snapshot](/circleci.png)

### Further Improvements/Todos
- Running all tests using WeatherBitTest class generates a summary that shows test count as 1. This can be improved to show actual test count in CircleCI.
- Reporting artifacts can be uploaded to CircleCI and reports can be made available throught its CircleCI app.
- Depending on the nature of the actual project/api, folder structure can be adjusted accordingly to fit project needs.
- Karate logging can be improved.