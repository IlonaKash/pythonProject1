*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${url}      https://stem.release.stemscopes-v4-dev.aws.acceleratelearning.com/login
${browser}      chrome   #  gc     headlesschrome

# $ - string ("string", 123, "123:)
# @ - list ["qwe", '123']
# G - dict {"key": 'value'}

*** Test Cases ***
1. Test Open Brouser
     [Documentation]    check login page
     [Tags]    Smoke
     open browser     ${url}     ${browser}      service_log_path=webdriver.log
     maximize browser window
     ${test}      get location
     sleep     3s

2. Test login with wrong credentions


*** Keywords ***
