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
@{list}      Vova      Anna       Natalia
&{dict}     name=Ilona      surname=Kashkan

*** Test Cases ***
1. Test Open Brouser and login
     [Documentation]    check login page
     [Tags]    Smoke
     open browser     ${url}     ${browser}      service_log_path=webdriver.log
     maximize browser window
     input text    id:react-select-2-input      Texas
     sleep     2s
     press keys    id:react-select-2-input     \ue007
     press keys    ${none}    \ue007
     sleep    3s
     input text     id:react-select-3-input     Texas
     press keys    ${none}    \ue007
     sleep       5s
     input text    id:username      ikashkan
     input text    id:password      12345678Lone
     press keys    ${none}    \ue007

   #  click button    class:chakra-button emotion-css-cache-180278s
     sleep    5s
     ${test}      get location
    # sleep     3s

2. Test login with right credentions
      set test variable    ${name}      Ilona
      log     ${name}
      set test variable    ${surname}      Kashkan
      log      ${surname}
      ${fullname}      evaluate    "${name}"+"${surname}"

3. Check Variables (suit level)
     # ${list}    create list
      log    ${list}
     # ${dict}    create dictionary
      log many    ${dict}
     APPEND TO LIST       ${list}     Luck
     log      ${list}
     insert into list    ${list}      0      Cat
     log      ${list}
     ${l}     get length    ${list}[2]
     log to console     ${l}