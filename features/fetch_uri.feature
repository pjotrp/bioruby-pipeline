Feature: Fetch a file using a URI
  In order go fetch files from other locations
  A user gives a URI and an optional MD5 checksum
  And the library downloads the file, if it is not there

  Scenario: Fetch the URI and check the MD5 when it is available
    Given a file and an MD5
    When I want to fetch the file through a URI
    Then it checks the MD5
    And it should download the file if there is no match
    And it should test for an MD5 match

  Scenario: Fetch the URI when no MD5 is available
    Given a file
    When I want to fetch the file through a URI
    Then it should download the file if there is no match
    And it should save an MD5 (regardless)
