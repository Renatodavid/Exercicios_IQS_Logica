*** Settings ***
*** Variables ***
${dividendo}    40
${divisor}    7
*** Test Cases ***
Calcular Divisão
   
    

  
    ${quociente}=    Evaluate    ${dividendo} // ${divisor}
    ${resto}=    Evaluate    ${dividendo} % ${divisor}

    
    Log To Console    Dividendo: ${dividendo}
    Log To Console    Divisor: ${divisor}
    Log To Console    Quociente: ${quociente}
    Log To Console    Resto: ${resto}


