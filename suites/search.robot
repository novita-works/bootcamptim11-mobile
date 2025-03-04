*** Settings ***
Resource                                  ../pageobjects/homeScreen/homeScreen.robot
Resource                                  ../pageobjects/resultScreen/resultScreen.robot
Resource                                  ../pageobjects/searchScreen/searchScreen.robot
Resource                                  ../pageobjects/signinScreen/signinScreen.robot
Resource                                  ../pageobjects/base.robot
Test Setup          Run Keywords  Open Flight Application  AND  Verify Home Screen Appears  AND  User Sign In
Test Teardown       Close Flight Application  
*** Variables ***
${EMPTY_FLIGHTNUMBER}    
${NON-ALFANUMERIK_FLIGHTNUMBER}    GA!@#
${SPACE_FLIGHTNUMBER}    GA 935
${LOWERCASE_FLIGHTNUMBER}    ga935
${INVALID_FLIGHTNUMBER}    XX999
${EMOJI_FLIGHTNUMBER}      GA935🛫
${MULTIPLE_SPACES_FLIGHTNUMBER}   GA    935
${MIXED_CASE_FLIGHTNUMBER}        Ga935
${ALPHA_ONLY_FLIGHTNUMBER}        GAABS
${NUMERIC_ONLY_FLIGHTNUMBER}      12345


*** Keywords ***
Input Empty Flight Number
    Input Text                            locator=${LOC_INPUT}    text=${EMPTY_FLIGHTNUMBER}
Input Non-Alphanumeric Character Flight Number
    Input Text                            locator=${LOC_INPUT}     text=${NON-ALFANUMERIK_FLIGHTNUMBER}
Input Space Character Flight Number
    Input Text                            locator=${LOC_INPUT}   text=${SPACE_FLIGHTNUMBER}
Input Lowercase Flight Number
    Input Text                            locator=${LOC_INPUT}    text=${LOWERCASE_FLIGHTNUMBER}
Input Invalid Flight Number
    Input Text                            locator=${LOC_INPUT}     text=${INVALID_FLIGHTNUMBER}
Input Emoji Flight Number
    Input Text                            locator=${LOC_INPUT}    text=${EMOJI_FLIGHTNUMBER}
Input Multiple Spaces Flight Number
    Input Text                            locator=${LOC_INPUT}    text=${MULTIPLE_SPACES_FLIGHTNUMBER}
Input Mixed Case Flight Number
    Input Text                            locator=${LOC_INPUT}    text=${MIXED_CASE_FLIGHTNUMBER}
Input Alpha Only Flight Number
    Input Text                            locator=${LOC_INPUT}    text=${ALPHA_ONLY_FLIGHTNUMBER}
Input Numeric Only Flight Number
    Input Text                            locator=${LOC_INPUT}    text=${NUMERIC_ONLY_FLIGHTNUMBER}


*** Test Cases ***
Valid Input Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Valid Flight Number
    Click Search Button
    Verify Result Screen Appears

Empty Input Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Empty Flight Number
    Click Search Button
    Verify Error Empty Flight Number

Non-Alphanumeric Character Input Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Non-Alphanumeric Character Flight Number
    Click Search Button
    Verify Error Non-Alphanumeric Flight Number

Space Character Input Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Space Character Flight Number
    Click Search Button
    Verify Error Space Character Flight Number

Lowercase Input Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Lowercase Flight Number
    Click Search Button
    Verify Error Lowercase Flight Number

Invalid Input Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Invalid Flight Number
    Click Search Button
    Verify Error Invalid Flight Number

Emoji In Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Emoji Flight Number
    Click Search Button
    Verify Error Non-Alphanumeric Flight Number

Multiple Spaces In Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Multiple Spaces Flight Number
    Click Search Button
    Verify Error Space Character Flight Number

Mixed Case Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Mixed Case Flight Number
    Click Search Button
    Verify Error Invalid Flight Number

Alpha Only Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Alpha Only Flight Number
    Click Search Button
    Verify Error Invalid Flight Number

Numeric Only Flight Number
    Click Search Home Button
    Verify Flight Number
    Input Numeric Only Flight Number
    Click Search Button
    Verify Error Invalid Flight Number

