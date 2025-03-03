*** Settings ***
Library                                  AppiumLibrary    
Variables                                search-screen-locators.yaml

*** Variables ***
${VALID_FLIGHTNUMBER}    DA935

*** Keywords ***
Input Valid Flight Number
    Input Text                          locator=${LOC_INPUT}    text=${VALID_FLIGHTNUMBER}  
Click Search Button
    Click Element                       locator=${LOC_SEARCH_BUTTON}
Click Search Home Button   
    Click Element                       locator=${LOC_FIRST_BUTTON}
Verify Flight Number
    Wait Until Element Is Visible     locator=${LOC_INPUT} 
Verify Error Empty Flight Number
    Wait Until Element Is Visible    locator=${LOC_ERROR_EMPTY} 
Verify Error Non-Alphanumeric Flight Number
    Wait Until Element Is Visible     locator=${LOC_ERROR_NONALPHA} 
Verify Error Space Character Flight Number
    Wait Until Element Is Visible     locator=${LOC_ERROR_SPACE} 
Verify Error Lowercase Flight Number
    Wait Until Element Is Visible     locator=${LOC_ERROR_LOWERCASE} 
Verify Error Invalid Flight Number
    Wait Until Element Is Visible     locator=${LOC_ERROR_INVALID} 
Hide The Keyboard
    Hide Keyboard    key_name=