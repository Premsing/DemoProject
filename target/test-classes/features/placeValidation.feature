Feature: Validating Place API's
@AddPlace @Regression
Scenario Outline: Verify if place is being added successfully using AddPlaceAPI
	Given Add Place payload "<name>" "<language>" "<address>"
	When user calls "AddPlaceAPI" with "POST" HTTP request
	Then the API call got success with status code 200
	And "status" in response body is "OK"
	And "scope" in response body is "APP"
	And verify place_id created maps to "<name>" using "getPlaceAPI"
	
	
Examples:
	|name		|language|address		    |
	|White House|Marathi |World cross center|
#	|Batla House|Punjabi |Sea cross Lakeside|

@DeletePlace @Regression
Scenario: Verify if the Delete Place functionality is working
	Given DeletePlace Payload
	When user calls "deletePlaceAPI" with "POST" HTTP request
	Then the API call got success with status code 200
	And "status" in response body is "OK"
	
	