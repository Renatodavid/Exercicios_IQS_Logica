*** Settings ***


*** Variables ***

${largura}    18
${comprimento}    25 
${preco_por_metro_quadrado}    54

*** Test Cases ***
Calcular Área e Preço do Terreno
    ${area}=    Evaluate    ${largura} * ${comprimento}
    ${preco}=    Evaluate    ${area} * ${preco_por_metro_quadrado}

    Log To Console    \nÁrea do terreno: ${area} metros quadrados
    Log To Console    \nPreço do terreno: R$ ${preco}
