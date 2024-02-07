*** Settings ***

*** Variables ***
${numero_louças}    ${5}

*** Test Cases ***
for
    FOR  ${i}  IN  RANGE    ${numero_louças}
        Log To Console    uma louça foi lavada!
        ${numero_louças}    Evaluate    ${numero_louças} - ${i} - 1
        ${i}    Evaluate    ${i} + 1
        Log To Console    Restam ${numero_louças}
    END
    