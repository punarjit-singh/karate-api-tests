## Running the tests:
    mvn test -Dkarate.env=prod

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