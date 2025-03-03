*** Settings ***
Library                              AppiumLibrary    
Variables                            result-screen-locators.yaml

# *** Variables ***

*** Keywords ***
Verify Result Screen Appears
    Wait Until Element Is Visible    locator=${LOC_RESULTSCREEN}
