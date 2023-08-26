*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Keywords ***
Keyword Loop WHILE
   [Arguments]     ${green_fruits}   ${index}=default   ${max_index}=default
   WHILE    ${index} <= ${max_index}
        ${fruit}    Get From List    ${fruits}    ${index}
        IF    '${fruit}' in ['kiwi', 'lime', 'avocado']
            Append To List    ${green_fruits}    ${fruit}
        END
        ${index}    Evaluate    ${index} + 1
    END

    Log To Console    ${green_fruits}