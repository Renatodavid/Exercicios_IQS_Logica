*** Settings ***
Resource    common.resource

*** Test Cases ***
teste1 realizar autenticação com bases validas
    [Tags]    fluxo-principal    POST    
    ${response}    Post /auth    PostAuthValid.json

    Status Should Be    200
    Validate Json    ${response}    CreateTokenValid.json

teste2 realizar autenticação com bases invalidas
    ${response}    Post /auth    PostAuthInvalid.json

    #Status Should Be    401
    Validate Json    ${response}    CreateTokenInvalid.json
