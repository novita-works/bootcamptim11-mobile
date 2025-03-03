*** Settings ***
Library                              AppiumLibrary    
Variables                            home-screen-locators.yaml

# *** Variables ***

*** Keywords ***
Verify Home Screen Appears
    Wait Until Element Is Visible    locator=${LOC_HOMESCREEN}
