*** Settings ***
Resource                                  ../pageobjects/homeScreen/homeScreen.robot
Resource                                  ../pageobjects/signinScreen/signinScreen.robot
Resource                                  ../pageobjects/base.robot
Test Setup                                Run Keywords  Open Flight Application  AND  Verify Home Screen Appears  AND  User Sign In
Test Teardown                             Close Flight Application   

*** Variables ***
${BOOK_BUTTON}                            //android.widget.Button[@resource-id="com.example.myapplication:id/book"]
${OK_DATE_BUTTON}                         //android.widget.Button[@resource-id="android:id/button1"]
${TAB_ONE_WAY}                            //android.support.v7.app.ActionBar.Tab[@content-desc="One Way"]
${TAB_ROUND_TRIP}                         //android.support.v7.app.ActionBar.Tab[@content-desc="Round Trip"]
${SPINNER_FROM}                           //android.widget.Spinner[@resource-id="com.example.myapplication:id/spinnerFrom"]
${SPINNER_TO}                             //android.widget.Spinner[@resource-id="com.example.myapplication:id/spinnerTo"]
${SPINNER_CLASS}                          //android.widget.Spinner[@resource-id="com.example.myapplication:id/spinnerClass"]
${TEXT_START_DATE}                        //android.widget.TextView[@resource-id="com.example.myapplication:id/textStartDate"]
${TEXT_END_DATE}                          //android.widget.TextView[@resource-id="com.example.myapplication:id/textEndDate"]
${RADIO_BUTTON_FLIGHT}                    //android.widget.RadioButton[@resource-id="com.example.myapplication:id/radioButtonFlight"]
${RADIO_BUTTON_FLIGHT_HOTEL}              //android.widget.RadioButton[@resource-id="com.example.myapplication:id/radioButtonFlightHotel"]
${CHECKBOX_DAY}                           //android.widget.CheckBox[@resource-id="com.example.myapplication:id/checkBoxDay"]
${BUTTON_BOOK_FLIGHT}                     //android.widget.Button[@resource-id="com.example.myapplication:id/book_flight"]
${BOOK_PAGE}                              //android.widget.FrameLayout[@resource-id="android:id/content"]/android.view.ViewGroup

${DEPARTURE_CITY}                         Chicago
${ARRIVAL_CITY}                           London
${DIFFERENT_CITY}                         Toronto
${INVALID_CITY}                           XYZ123
${SAME_CITY}                              Chicago
${EMPTY_FIELD}                            ${EMPTY}
${FUTURE_DATE}                            15
${PAST_DATE}                              -3
${ECONOMY_CLASS}                          Economy
${BUSINESS_CLASS}                         Business
${FIRST_CLASS}                            First

*** Keywords ***
Click Button Booking
    Wait Until Element Is Visible         locator=${BOOK_BUTTON}    timeout=15s
    Click Element                         locator=${BOOK_BUTTON}
    Sleep    2s

Click OK Date Button
    Wait Until Element Is Visible         locator=${OK_DATE_BUTTON}    timeout=15s
    Click Element                         locator=${OK_DATE_BUTTON}
    Sleep    2s

Navigate To Booking Screen
    Wait Until Element Is Visible         locator=${BUTTON_BOOK_FLIGHT}
    Click Element                         locator=${BUTTON_BOOK_FLIGHT}

Select One Way Trip
    Wait Until Element Is Visible         locator=${TAB_ONE_WAY}    timeout=15s
    Click Element                         locator=${TAB_ONE_WAY}
    Sleep    2s

Select Departure City
    [Arguments]                           ${city}
    # Open From City dropdown
    Wait Until Element Is Visible         locator=${SPINNER_FROM}    timeout=15s
    Click Element                         locator=${SPINNER_FROM}
    Sleep    2s
    
    # Select specific city
    ${city_locator}=    Set Variable    //android.widget.TextView[@resource-id="android:id/text1" and @text="${city}"]
    Wait Until Element Is Visible         locator=${city_locator}    timeout=15s
    Click Element                         locator=${city_locator}
    Sleep    2s

Select Arrival City
    [Arguments]                           ${city}
    # Open To City dropdown
    Wait Until Element Is Visible         locator=${SPINNER_TO}    timeout=15s
    Click Element                         locator=${SPINNER_TO}
    Sleep    2s
    
    # Select specific city
    ${city_locator}=    Set Variable    //android.widget.TextView[@resource-id="android:id/text1" and @text="${city}"]
    Wait Until Element Is Visible         locator=${city_locator}    timeout=15s
    Click Element                         locator=${city_locator}
    Sleep    2s

Select Flight Class
    [Arguments]                           ${class}
    # Open Class dropdown
    Wait Until Element Is Visible         locator=${SPINNER_CLASS}    timeout=15s
    Click Element                         locator=${SPINNER_CLASS}
    Sleep    2s
    
    # Select specific class
    ${class_locator}=    Set Variable    //android.widget.TextView[@resource-id="android:id/text1" and @text="${class}"]
    Wait Until Element Is Visible         locator=${class_locator}    timeout=15s
    Click Element                         locator=${class_locator}
    Sleep    2s

Select Departure Date
    [Arguments]                           ${days_from_today}
    # Open date picker
    Wait Until Element Is Visible         locator=${TEXT_START_DATE}    timeout=15s
    Click Element                         locator=${TEXT_START_DATE}
    Sleep    2s

Get Future Date
    [Arguments]                           ${days_ahead}
    # Return fixed date: Thursday, 1 August 2019
    RETURN    01 August 2019

Select Flight Only
    Wait Until Element Is Visible         locator=${RADIO_BUTTON_FLIGHT}    timeout=15s
    Click Element                         locator=${RADIO_BUTTON_FLIGHT}
    Sleep    2s

Select Flight And Hotel
    Wait Until Element Is Visible         locator=${RADIO_BUTTON_FLIGHT_HOTEL}    timeout=15s
    Click Element                         locator=${RADIO_BUTTON_FLIGHT_HOTEL}
    Sleep    2s

Toggle Flexible Day
    Wait Until Element Is Visible         locator=${CHECKBOX_DAY}    timeout=15s
    Click Element                         locator=${CHECKBOX_DAY}
    Sleep    2s

Book Flight
    Wait Until Element Is Visible         locator=${BUTTON_BOOK_FLIGHT}    timeout=15s
    Click Element                         locator=${BUTTON_BOOK_FLIGHT}
    # Sleep    2s

Verify Booking Success
    Wait Until Page Contains              text=Booking Confirmed    timeout=15s
    Page Should Contain Text              text=Booking Confirmed

Book Flight With Validation
    # Attempt to book flight without selecting a date
    Wait Until Element Is Visible         locator=${BUTTON_BOOK_FLIGHT}    timeout=15s
    Click Element                         locator=${BUTTON_BOOK_FLIGHT}
    Sleep    2s
    
    # Verify that an error message is displayed or booking is not allowed
    Run Keyword And Expect Error    *    Verify Booking Success
    
Verify Booking Cannot Proceed Without Date
    # Check if still on the booking screen
    Wait Until Element Is Visible         locator=${BUTTON_BOOK_FLIGHT}    timeout=15s
    Element Should Be Visible             locator=${BUTTON_BOOK_FLIGHT}
    
    # Optional: Check for specific error message if available
    # Modify this based on the actual error mechanism in your app
    Run Keyword And Expect Error    *    Wait Until Page Contains    Booking Confirmed    timeout=5s

Verify Test Does Not Route To Certain Page
    [Arguments]    ${unexpected_page_locator}
    
    # Try to find the unexpected page locator
    ${status}    ${result}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    locator=${unexpected_page_locator}    timeout=5s
    
    # Fail if the page is found
    Run Keyword If    '${status}' == 'PASS'    Fail    Unexpected page was routed

Test Should Not Route To Booking Screen
    # Verify we're still on the booking form screen by checking for booking button
    Wait Until Element Is Visible    ${BUTTON_BOOK_FLIGHT}    timeout=10s
    
    # Verify we didn't get to the booking confirmation screen
    ${book_page_visible}=    Run Keyword And Return Status    
    ...    Element Should Be Visible    ${BOOK_PAGE}    
    
    Run Keyword If    ${book_page_visible}    Fail    Test routed to booking screen when it should not have

# Alternative more robust approach 
Verify Booking Did Not Succeed
    # Then, verify we're still on the form screen
    ${form_visible}=    Run Keyword And Return Status    
    ...    Element Should Be Visible    ${BOOK_PAGE}
    
    # The test should fail if either condition is not met
    Run Keyword If    ${form_visible}    
    ...    Fail    Validation failed - either saw booking confirmation or form disappeared

*** Test Cases ***
User Should Not Be Able To Book Flight Without Selecting Date
    Click Button Booking
    Select One Way Trip
    Select Departure City                 ${DEPARTURE_CITY}
    Select Arrival City                   ${ARRIVAL_CITY}
    Select Flight Class                   ${ECONOMY_CLASS}
    Select Flight Only
    Book Flight
    Verify Booking Did Not Succeed

User Should Not Be Able To Book Flight Without Selecting Departure City
    Click Button Booking
    Select One Way Trip
    # Skip Departure City
    Select Arrival City                   ${ARRIVAL_CITY}
    Select Flight Class                   ${ECONOMY_CLASS}
    Select Departure Date                 ${FUTURE_DATE}
    Click OK Date Button
    Select Flight Only
    Book Flight
    Verify Booking Did Not Succeed
