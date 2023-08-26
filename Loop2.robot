*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String
Resource        GlobolKeyWords.robot


*** Variables ***
@{fruits}               apple    banana    pear    kiwi    orange    lime    avocado

*** Test Cases ***

1.Filter Green Fruits Using FOR Loop
    ${green_fruits}    Create List
    Loop for adding green fruits  ${green_fruits}


2. Filter Green Fruits Using WHILE Loop
    ${green_fruits}    Create List
    ${index}           Set Variable    0
    ${max_index}  Set Variable    6
    Keyword Loop WHILE    ${green_fruits}   4   6





*** Keywords ***
Loop for adding green fruits
   [Documentation]
   ...  adding green fruits to the list
   [Arguments]    ${green_fruits}
   FOR    ${fruit}    IN    @{fruits}
        IF    '${fruit}' in ['kiwi', 'lime', 'avocado']
            Append To List    ${green_fruits}    ${fruit}
        END
    END
       Log To Console    ${green_fruits}




