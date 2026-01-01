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


Register Success
    Fill Registration       Somyod      Sodsai      ${EMPTY}      somyod@kkumail.com      091-001-1234
    Capture Page ScreenShot     Screenshot/fill_registration.png
    Click Button        ${REG_BTN}
    Wait Until Location Contains    Success.html
    Wait Until Page Contains        Thank you for registering with us.
    Wait Until Page Contains        We will send a confirmation to your email soon.
    Capture Page ScreenShot     Screenshot/register_result.png
    Close Browser

