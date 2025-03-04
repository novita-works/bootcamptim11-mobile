*** Settings ***
Library                      AppiumLibrary   
Resource    ../pageobjects/signinScreen/signinScreen.robot 
Resource    ../pageobjects/searchScreen/searchScreen.robot 

*** Variables ***
${REMOTE_URL}                http://127.0.0.1:4723
${PLATFORM_NAME}             Android
${PLATFORM_VERSION}          14
${DEVICE_NAME}               Android Emulator
${APP_PACKAGE}               com.example.myapplication
${APP_ACTIVITY}              com.example.myapplication.MainActivity
${AUTOMATION_NAME}           uiautomator2

*** Keywords ***
Open Flight Application
    Open Application         remote_url=${REMOTE_URL}    
    ...                      platformName=${PLATFORM_NAME}   
    ...                      platformVersion=${PLATFORM_VERSION}    
    ...                      deviceName=${DEVICE_NAME}    
    ...                      appPackage=${APP_PACKAGE}    
    ...                      appActivity=${APP_ACTIVITY}    
    ...                      automationName=${AUTOMATION_NAME}

Close Flight Application
    Close Application   

 User Sign In
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Input Text    locator=${LOC_USERNAME}    text=${VALID_USERNAME}
    Input Password    locator=${LOC_PASSWORD}    text=${VALID_PASSWORD}
    Click Sign In Button on Sign In Screen 
    Verify User Successfully Sign In

Hide The Keyboard
    Hide Keyboard
    