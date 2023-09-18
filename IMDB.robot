*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String



*** Variables ***
${BROWSER}      Chrome   #
${IMDB_URL}     https://www.imdb.com/
@{FAVORITE_MOVIES}    Titanic    The Godfather    Pulp Fiction    The Matrix     Star Wars    Gladiator    The Lion King     WALL·E    American Beauty    Requiem for a Dream

*** Test Cases ***
1.Get IMDb Ratings
    &{sorted_ratings}       Create Dictionary
    Open Browser    ${IMDB_URL}    ${BROWSER}
    Maximize Browser Window
    FOR    ${movie}    IN    @{FAVORITE_MOVIES}
        ${rating} =    Get IMDb Rating    ${movie}
        Set To Dictionary     ${sorted_ratings}    ${movie}=${rating}
    END
    Close Browser
     ${sorted_items} =    Sort Dictionary By Values In Descending Order    ${sorted_ratings}

    FOR    ${key}    ${value}    IN    @{sorted_items}
        Log To Console       ${key}: ${value}
    END

#    Get Dictionary Values    ${sorted_ratings}
#    Log To Console    ${sorted_ratings}
#    ${sorted_ratings} =  Sort Dictionary By Values    ${ratings}    reverse=True
#    Log Many    ${sorted_ratings}

*** Keywords ***
Get IMDb Rating
    [Arguments]    ${movie}
    Input Text    //*[@id="suggestion-search"]    ${movie}
    Click Element    //*[@id="suggestion-search-button"]
    Wait Until Page Contains Element    //*[@class="ipc-metadata-list ipc-metadata-list--dividers-after sc-17bafbdb-3 gAWnDM ipc-metadata-list--base"]//*[@class="ipc-metadata-list-summary-item ipc-metadata-list-summary-item--click find-result-item find-title-result"][1]
    Click Element    //*[@class="ipc-metadata-list ipc-metadata-list--dividers-after sc-17bafbdb-3 gAWnDM ipc-metadata-list--base"]//*[@class="ipc-metadata-list-summary-item ipc-metadata-list-summary-item--click find-result-item find-title-result"][1]
    Wait Until Page Contains Element    //span[@class='sc-bde20123-1 iZlgcd'][1]
    ${rating} =    Get Text    //span[@class='sc-bde20123-1 iZlgcd'][1]
    [Return]    ${rating}

Sort Dictionary By Values In Descending Order
    [Arguments]    ${dict}
    [Documentation]    Sorts a dictionary by values in descending order.
    ${sorted_items} =    Evaluate    [item for item in sorted(${dict}.items(), key=lambda item: item[1], reverse=True)]
    [Return]    ${sorted_items}