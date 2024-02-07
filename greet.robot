*** Settings ***

*** Variables ***
${GREETING}    OI MUNDO CRUEL!

*** Test Cases ***
Greet User
    Log To Console    \n${GREETING}
