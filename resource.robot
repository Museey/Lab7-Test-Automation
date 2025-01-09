*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${DELAY}          0.2
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html
${FORM URL}       http://${SERVER}/form.html
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}Google Chrome for Testing.app${/}Contents${/}MacOS${/}Google Chrome for Testing
${CHROME_DRIVER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chromedriver
${FIRST_NAME}              Somsong
${LAST_NAME}               Sandee
${DESTINATION}             Europe
${CONTACT_PERSON}          Sodsai Sandee
${RELATIONSHIP}            Mother
${EMAIL}                   somsong@kkumail.com
${INVALID_EMAIL}           somsongLLLL
${PHONE_NO}                081-111-1234
${INVALID_PHONE_NO}        2345243535

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate   sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
# [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${LOGIN URL}
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Form Page Should Be Open
    Title Should Be    Customer Inquiry

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Complete Page Should Be Open
    Title Should Be    Completed
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patient.   

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page

Open Browser To Form Page
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Set Variable    ${chrome_options.binary_location}    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${FORM URL}
    Set Selenium Speed    ${DELAY}

Input First Name
    [Arguments]    ${FIRST_NAME}
    Input Text    firstname    ${FIRST_NAME}

Input Last Name
    [Arguments]    ${LAST_NAME}
    Input Text    lastname    ${LAST_NAME}

Input Destination
    [Arguments]    ${DESTINATION}
    Input Text    destination    ${DESTINATION}

Input Contact Person
    [Arguments]    ${CONTACT_PERSON}
    Input Text    contactperson    ${CONTACT_PERSON}

Input Relationship
    [Arguments]    ${RELATIONSHIP}
    Input Text    relationship    ${RELATIONSHIP}

Input Email
    [Arguments]    ${EMAIL}
    Input Text    email    ${EMAIL}

Input Phone Number
    [Arguments]    ${PHONE_NO}
    Input Text    phone    ${PHONE_NO}

Submit Data
    Click Button    submitButton


