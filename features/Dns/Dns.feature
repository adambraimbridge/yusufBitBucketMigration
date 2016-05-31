Feature: DNS API for managing Dynect DNS entries

     Scenario: Should get all the valid dns zones
        Given a config class
        Given I set the headers with api key as headers
        Given I set the url as url
        Given I make get zone request to the api with url ""https://dns-api.in.ft.com/v2/zone"
        Then the status code should be 200
        Then verify that dns get zone endpoint retrieves an existing zone "alan-api.ft.com"

     Scenario: Should create a dns entry of type A record
        Given a config class
        Given I set the headers with api key as headers
        Given I set the data as "dns_a"
        Given I set the create endpoint url as url
        Given I set the section as "dns_a"
        Given I make create dns entry request to the api with url "https://dns-api.in.ft.com/v2"
        Then the status code should be 200
        Then verify new dns entry in format "fqdn"
        Then verify dns record "type" is "A"

     Scenario: Should create a dns entry of type CNAME record
        Given a config class
        Given I set the headers with api key as headers
        Given I set the data as "dns_cname"
        Given I set the create endpoint url as url
        Given I set the section as "dns_cname"
        Given I make create dns entry request to the api with url "https://dns-api.in.ft.com/v2"
        Then the status code should be 200
        Then verify new dns entry in format "fqdn"
        Then verify dns record "type" is "CNAME"


     Scenario: Should return the currently specified DNS name and zone
        Given a config class
        Given I set the headers with API key as headers
        Given I set the section as "dns_cname"
        When I set the url in the format "https://dns-api.in.ft.com/v2/name/%s/%s"
        When I make api get name and zone request
        Then the status code should be 200
        Then verify zone and name exist in dns entry in format "fqdn"

     Scenario: Should delete a dns record or entry
         Given a config class
         Given I set the headers with API key as headers
         Given I set the section as "dns_cname"
         When I set the dns name and zone data
         Given I set the delete endpoint url as url
         Given I make a call to the api with url "https://version-api.in.ft.com/v2"
         Then the status code should be 200
         Then verify that empty response is returned

     Scenario: Should delete a dns record or entry
         Given a config class
         Given I set the headers with API key as headers
         Given I set the section as "dns_a"
         When I set the dns name and zone data
         Given I set the delete endpoint url as url
         Given I make a call to the api with url "https://version-api.in.ft.com/v2"
         Then the status code should be 200
         Then verify that empty response is returned




