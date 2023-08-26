*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String


#1 - открытие браузера и переход на страницу wikipedia
#2 - найти в wikipedia страницу про азубуку морзе(на русском языке)
#3 - собрать в словарь информацию "буква" = "напев" (А-Я)

*** Variables ***
${browser}      chrome
${url}     https://www.wikipedia.org/

*** Test Cases ***
1. Search Morse in Wikipedia
     Open Wikipedia page
     Find Азбука Морзе page
     Collect Morse Code Information
     Close Browser


*** Keywords ***
Open Wikipedia page
    open browser     ${url}   ${browser}    options=add_experimental_option("detach", True)
    Maximize Browser Window

Find Азбука Морзе page
    Page Should Contain Element     //*[@id="js-link-box-ru"]
    Click Element        //*[@id="js-link-box-ru"]
    Input Text    //*[@id="searchInput"]    Азбука морзе
    Sleep    3s
    press keys    ${none}    \ue007
    Click Element    //a/span[text()="Напевы"]

Collect Morse Code Information
    ${morse_dict}    Create Dictionary

    FOR    ${row}    IN RANGE      1    33
       
        ${letter}    Get Text    (//tbody)[1]/tr[${row}]/td[1]
        ${sound}     Get Text    (//tbody)[1]/tr[${row}]/td[4]
        Set To Dictionary    ${morse_dict}    ${letter}=${sound}
    END
    Log Many    ${morse_dict}
