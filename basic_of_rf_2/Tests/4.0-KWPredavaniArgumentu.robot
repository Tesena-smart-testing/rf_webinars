*** Settings ***
Documentation  Predavani a vraceni argumentu

Library  DebugLibrary

*** Variables ***


*** Test Cases ***
Volani vlastnich KW
    # ${a} =  Secti 1 s 2
    log to console  \n
    Secti 1 s 1
    Secti v argumentech  1  2
    Secti s nepovinnym argumentem  1
    Secti 1 s nepovinnym  3
    ${a} =  Secti a vrat vysledek  1  4
    Log to console  ${a}[0]:${a}[1]
    Secti a uloz vysledek  1   5
    Log to console  Global vysledek: ${vysledek}

*** Keywords ***
Secti ${a} s ${b}
    ${vysledek} =  Evaluate  ${a} + ${b}
    log to console  VYSLEDEK: ${vysledek}

Secti v argumentech
    [Arguments]  ${a}  ${b}
    ${vysledek} =  Evaluate  ${a} + ${b}
    log to console  VYSLEDEK: ${vysledek}

Secti s nepovinnym argumentem
    [Arguments]  ${a}  
    ...          ${b}=0   
    ...          ${c}=0
    ${vysledek} =  Evaluate  ${a} + ${b}
    log to console  VYSLEDEK: ${vysledek}

Secti ${a} s nepovinnym 
    [Arguments]  ${b}=0    
    ${vysledek} =  Evaluate  ${a} + ${b}    
    log to console  VYSLEDEK: ${vysledek}

Secti a vrat vysledek
    [Arguments]  ${a}  ${b}
    ${vysledek} =  Evaluate  ${a} + ${b}
    [Return]  Secteno  ${vysledek}

Secti a uloz vysledek
    [Arguments]  ${a}  ${b}
    ${vysledek} =  Evaluate  ${a} + ${b}
    Set global variable  ${Vysledek}  ${vysledek}


