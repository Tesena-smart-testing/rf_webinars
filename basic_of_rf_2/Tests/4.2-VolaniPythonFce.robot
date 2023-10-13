*** Settings ***
Documentation  Volani funkce z pythonu primo z RF
...            Vraceni vice argumentu najednou

Library  DebugLibrary

Library   ../Library/ValidaceRodnehoCisla.py

*** Variables ***
${rc_validni} =            6302109011   # vygenerovane z: https://www.daytl.com/cs/birthnumber/
${rc_validni_se_znaky} =   63/02/10/9011
${rc_nevalidni} =          006302109011

*** Test Cases ***
Test volani python funkce
    ${a} =  Je ${rc_validni} rodne cislo
    ${b} =  Je ${rc_validni_se_znaky} rodne cislo
    ${c} =  Je ${rc_nevalidni} rodne cislo
    Vypis  ${rc_validni}           ${a}
    Vypis  ${rc_validni_se_znaky}  ${b}
    Vypis  ${rc_nevalidni}         ${c}

*** Keywords ***
Vypis
    [Arguments]  ${cislo}  ${vysledek}
    IF  ${vysledek}[0]
        Log to console  ${cislo} je validni rodne cislo: ${vysledek}[1] a datum narozeni je ${vysledek}[2]
    ELSE
        Log to console  ${cislo} neni validni rodne cislo: ${vysledek}
    END

Je ${cislo} rodne cislo
    ${je_rodne_cislo} =      evaluate  stdnum.cz.rc.is_valid('${cislo}')        modules=stdnum.cz.rc
    IF  ${je_rodne_cislo}  
        ${datum_narozeni} =  evaluate  stdnum.cz.rc.get_birth_date('${cislo}')  modules=stdnum.cz.rc
        ${cislo_oriznute} =  evaluate  stdnum.cz.rc.compact('${cislo}')         modules=stdnum.cz.rc
        RETURN  ${je_rodne_cislo}  ${cislo_oriznute}  ${datum_narozeni}
    ELSE
        ${chyba} =  Run Keyword And Expect Error  *   
        ...    evaluate  stdnum.cz.rc.validate('${rc_nevalidni}')  modules=stdnum.cz.rc 
        RETURN  ${False}  ${chyba}
    END  