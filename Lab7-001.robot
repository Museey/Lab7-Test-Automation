*** Settings ***
Resource    resource.robot
Library     SeleniumLibrary

*** Test Cases ***
Test Case 1
    Open Browser To Form Page
    Form Page Should Be Open
    Close Browser

Test Case 2
    Open Browser To Form Page
    Input First Name    ${FIRST_NAME}
    Input Last Name    ${LAST_NAME}
    Input Destination    ${DESTINATION}
    Input Contact Person    ${CONTACT_PERSON}
    Input Relationship    ${RELATIONSHIP}
    Input Email    ${EMAIL}
    Input Phone Number    ${PHONE_NO}
    Submit Data
    Complete Page Should Be Open
    Close Browser