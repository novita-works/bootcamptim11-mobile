*** Settings ***
Resource                                  ../pageobjects/homeScreen/homeScreen.robot
Resource                                  ../pageobjects/signinScreen/signinScreen.robot
Resource                                  ../pageobjects/base.robot
Test Setup                                Run Keywords        Open Flight Application    AND    Verify Home Screen Appears    
Test Teardown                             Close Flight Application   

*** Variables ***
${INVALID_USERNAME}                       ngen@digital.com
${INVALID_PASSWORD}                       123ABC
${INV_FORMAT_USERNAME}                    supportngendigital.com
${INV_FORMAT_PASSWORD}                    .
${EMPTY_LOCATOR}                          ""  
${LONG_USERNAME}                          testttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt
${LONG_PASSWORD}                          Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123!Password123! 
${LOG_INVALID_CREDENTIALS}                //android.widget.Toast[@text="Invalid username/password"]
${ERROR_EXPECTED}                         Invalid username/password

*** Keywords ***
Input Invalid Value of Username
    Input Text                            locator=${LOC_USERNAME}    text=${INVALID_USERNAME} 
Input Invalid Value of Password
    Input Password                        locator=${LOC_PASSWORD}    text=${INVALID_PASSWORD} 
Input Invalid Format of Username
    Input Text                            locator=${LOC_USERNAME}    text=${INV_FORMAT_USERNAME} 
Input Invalid Format of Password
    Input Password                        locator=${LOC_PASSWORD}    text=${INV_FORMAT_PASSWORD} 
Empty Username Field
    Input Text                            locator=${LOC_USERNAME}    text=${EMPTY_LOCATOR}
Empty Password Field
    Input Text                            locator=${LOC_USERNAME}    text=${EMPTY_LOCATOR}    
Input Long Username
    Input Text                            locator=${LOC_USERNAME}    text=${LONG_USERNAME} 
Input Long Password
    Input Password                        locator=${LOC_PASSWORD}    text=${LONG_PASSWORD} 
Verify User Failed Sign In With Invalid Credentials
    Wait Until Page Contains Element      locator=${LOG_INVALID_CREDENTIALS}    
    Wait Until Page Contains              text=${ERROR_EXPECTED}        

*** Test Cases ***
User Should Be Able to Sign In with Valid Data
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Input Valid Username
    Input Valid Password Sign In   
    Click Sign In Button on Sign In Screen 
    Verify User Successfully Sign In

User Should Not Be Able to Sign In with Invalid Value of Username
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Input Invalid Value of Username
    Input Valid Password Sign In   
    Click Sign In Button on Sign In Screen 
    Verify User Failed Sign In With Invalid Credentials

User Should Not Be Able to Sign In with Invalid Value of Password    
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Input Valid Username
    Input Invalid Value of Password   
    Click Sign In Button on Sign In Screen 
    Verify User Failed Sign In With Invalid Credentials

User Should Not Be Able to Sign In with Invalid Format of Username
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Input Invalid Format of Username
    Input Valid Password Sign In   
    Click Sign In Button on Sign In Screen 
    Verify User Failed Sign In With Invalid Credentials

User Should Not Be Able to Sign In with Invalid Format of Password    
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Input Valid Username
    Input Invalid Format of Password   
    Click Sign In Button on Sign In Screen 
    Verify User Failed Sign In With Invalid Credentials

User Should Not Be Able to Sign In with Empty Username
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Empty Username Field
    Input Valid Password Sign In   
    Click Sign In Button on Sign In Screen 
    Verify User Failed Sign In With Invalid Credentials

User Should Not Be Able to Sign In with Empty Password
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Input Valid Username
    Empty Password Field   
    Click Sign In Button on Sign In Screen 
    Verify User Failed Sign In With Invalid Credentials

User Should Not Be Able to Sign In with Empty Name & Password
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Empty Username Field
    Empty Password Field   
    Click Sign In Button on Sign In Screen 
    Verify User Failed Sign In With Invalid Credentials

User Should Not Be Able to Sign In with a Username Thats Too Long
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Input Long Username
    Input Valid Password Sign In   
    Click Sign In Button on Sign In Screen 
    Verify User Failed Sign In With Invalid Credentials

User Should Not Be Able to Sign In with a Password Thats Too Long
    Click Sign In Button on Home Screen
    Verify Sign In Screen Appears
    Input Valid Username
    Input Long Password   
    Click Sign In Button on Sign In Screen 
    Verify User Failed Sign In With Invalid Credentials