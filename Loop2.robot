*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
@{fruits}               apple    banana    pear    kiwi    orange    lime    avocado

*** Test Cases ***

1.Filter Green Fruits Using FOR Loop
    ${green_fruits}    Create List
    FOR    ${fruit}    IN    @{fruits}
        IF    '${fruit}' in ['kiwi', 'lime', 'avocado']
            Append To List    ${green_fruits}    ${fruit}
        END
    END
       Log To Console    ${green_fruits}


2. Filter Green Fruits Using WHILE Loop
    ${green_fruits}    Create List
    ${index}           Set Variable    0
    ${max_index}  Set Variable    6

    WHILE    ${index} <= ${max_index}
        ${fruit}    Get From List    ${fruits}    ${index}
        IF    '${fruit}' in ['kiwi', 'lime', 'avocado']
            Append To List    ${green_fruits}    ${fruit}
        END
        ${index}    Evaluate    ${index} + 1
    END

    Log To Console    ${green_fruits}
