*** Settings ***

Library    Collections
Library    RequestsLibrary
Library    JSONLibrary


*** Variables ***

${BASE_URL}     https://restful-booker.herokuapp.com

${CONTRACT_DIR}     ${CURDIR}/contracts
${PAYLOAD_DIR}      ${CURDIR}/payloads 

*** Keywords ***
Validate Json
    [Arguments]    ${response}    ${filename}
    Validate Json By Schema File    ${response.json()}    ${CONTRACT_DIR}${/}${filename}

Post /auth
    [Arguments]    ${filename}
    ${body}    Load Json From File    ${PAYLOAD_DIR}${/}${filename}
    ${response}    POST    url=${BASE_URL}/auth    json=${body}
    RETURN    ${response}

Get /booking
    ${response}    GET    url=${BASE_URL}/booking
    RETURN    ${response}

Get /booking/${id}
    ${response}    GET    url=${BASE_URL}/booking/${id}
    RETURN    ${response}

PUT /booking/${id}
    [Arguments]    ${filename}
    ${body}    Load Json From File    ${PAYLOAD_DIR}${/}${filename}
    ${headers}    Create Dictionary    Cookie=token\=${TOKEN}
    ${response}    PUT    url=${BASE_URL}/booking/${id}    json=${body}    headers=${headers}
    RETURN    ${response}

Wrapper POST /auth
    ${response}    POST /auth    PostAuthValid.json
    ${TOKEN}    Set Variable    ${response.json()}[token]
    Set Test Variable    ${TOKEN}
    
Select random bookingId from json
    [Arguments]    ${response}
    ${bookingid}    Evaluate    randon.choice($response.json())
    