*** Settings ***
Resource    resource.robot
Test Setup        Open Browser To Form Page
Test Teardown     Close Browser
Test Template     Fill form with invalid data gonna fail         

*** Test Cases ***      First Name       Last Name       Destination       Contact Person       Relationship       Email               Phone Number               Error Message
Empty Destination       ${FIRST_NAME}    ${LAST_NAME}    ${EMPTY}          ${CONTACT_PERSON}    ${RELATIONSHIP}    ${EMAIL}             ${PHONE_NO}               Please enter your destination.
Empty Email             ${FIRST_NAME}    ${LAST_NAME}    ${DESTINATION}    ${CONTACT_PERSON}    ${RELATIONSHIP}    ${EMPTY}            ${PHONE_NO}               Please enter a valid email address.
Invalid Email           ${FIRST_NAME}    ${LAST_NAME}    ${DESTINATION}    ${CONTACT_PERSON}    ${RELATIONSHIP}    ${INVALID_EMAIL}    ${PHONE_NO}               Please enter a valid email address.
Empty Phone Number      ${FIRST_NAME}    ${LAST_NAME}    ${DESTINATION}    ${CONTACT_PERSON}    ${RELATIONSHIP}    ${EMAIL}             ${EMPTY}                   Please enter a phone number.
Invalid Phone Number    ${FIRST_NAME}    ${LAST_NAME}    ${DESTINATION}    ${CONTACT_PERSON}    ${RELATIONSHIP}    ${EMAIL}         ${INVALID_PHONE_NO}    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)

*** Keywords ***
Fill form with invalid data gonna fail
    [Arguments]             ${FIRST_NAME}    ${LAST_NAME}   ${DESTINATION}    ${CONTACT_PERSON}    ${RELATIONSHIP}    ${EMAIL}    ${PHONE_NO}    ${ERROR_MESSAGE}
    Input First Name        ${FIRST_NAME}
    Input Last Name         ${LAST_NAME}
    Input Destination       ${DESTINATION}
    Input Contact Person    ${CONTACT_PERSON}
    Input Relationship      ${RELATIONSHIP}
    Input Email             ${EMAIL}
    Input Phone Number      ${PHONE_NO}
    Submit Data
    Still On Form Page
    Error Message Should Be Show    ${ERROR_MESSAGE}

Still On Form Page
    Form Page Should Be Open

Error Message Should Be Show
    [Arguments]    ${ERROR_MESSAGE}
    Element Text Should Be    xpath=//p[@id="errors"]    ${ERROR_MESSAGE}



