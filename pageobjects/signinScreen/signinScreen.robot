*** Settings ***
Library                                  AppiumLibrary    
Variables                                signin-screen-locators.yaml

*** Variables ***
${VALID_USERNAME}                        support@ngendigital.com
${VALID_PASSWORD}                        abc123

*** Keywords ***
Click Sign In Button on Home Screen
    Click Element                       locator=${LOC_SIGNIN_HOMESCREEN}
Verify Sign In Screen Appears    
    Wait Until Element Is Visible       locator=${LOC_USERNAME}
    Wait Until Element Is Visible       locator=${LOC_PASSWORD}
    Wait Until Element Is Visible       locator=${LOC_SIGNIN_SCREEN}
Input Valid Username
    Input Text                          locator=${LOC_USERNAME}    text=${VALID_USERNAME}    
Input Valid Password Sign In
    Input Password                      locator=${LOC_PASSWORD}    text=${VALID_PASSWORD}        
Click Sign In Button on Sign In Screen
    Click Element                       locator=${LOC_SIGNIN_SCREEN}
Verify User Successfully Sign In
    Wait Until Page Contains Element    locator=${LOC_DASHBOARD}
    Element Name Should Be              locator=${LOC_DASHBOARD}        
    ...                                 expected=NGen Digital
