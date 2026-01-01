*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${REGISTRATION URL}       http://localhost:7272/Registration.html
${BROWSER}      chrome

${INPUT_FIRSTNAME}      id=firstname
${INPUT_LASTNAME}      id=lastname
${INPUT_ORGANIZATION}      id=organization
${INPUT_EMAIL}      id=email
${INPUT_PHONE}      id=phone
${REG_BTN}      id=registerButton


*** Keywords ***
Open Workshop Registration
    Open Browser        ${REGISTRATION URL}     ${BROWSER}

Fill Registration
    [Arguments]     ${fname}    ${lname}    ${organization}     ${email}    ${phone}
    Input Text      ${INPUT_FIRSTNAME}      ${fname}
    Input Text      ${INPUT_LASTNAME}      ${lname}
    Input Text      ${INPUT_ORGANIZATION}      ${organization}
    Input Text      ${INPUT_EMAIL}      ${email}
    Input Text      ${INPUT_PHONE}      ${phone}


*** Test Cases ***
Open Workshop Registration Page
    Open Workshop Registration
    Capture Page ScreenShot     Screenshot/open_workshop_registration_page.png


Empty First Name and Last Name
    Fill Registration       ${Empty}     ${Empty}      CS KKU      somyod@kkumail.com      091-001-1234
    Capture Page ScreenShot     Screenshot/fill_registration.png
    Click Button        ${REG_BTN}
    Wait Until Location Contains    Registration.html
    Wait Until Page Contains        Please enter your name!!
    Capture Page ScreenShot     Screenshot/register_withoutName_result.png
    Close Browser

Empty Email
    Open Workshop Registration
    Fill Registration       Somyod     Sodsai      CS KKU      ${Empty}      091-001-1234
    Capture Page ScreenShot     Screenshot/fill_registration.png
    Click Button        ${REG_BTN}
    Wait Until Location Contains    Registration.html
    Wait Until Page Contains        Please enter your email!!
    Capture Page ScreenShot     Screenshot/register_withoutEmail_result.png
    Close Browser

