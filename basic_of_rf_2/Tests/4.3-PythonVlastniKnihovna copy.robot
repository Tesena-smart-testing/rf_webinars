*** Settings ***
Documentation  Vlastni python knihovna
...            Alternativa k 3.3 kde se funkce volaji primo

Library  DebugLibrary
Library  OperatingSystem

Library  ../Library/ValidaceRodnehoCisla.py

*** Variables ***
${rc_validni} =            6302109011   # vygenerovane z: https://www.daytl.com/cs/birthnumber/
${rc_validni_se_znaky} =   63/02/10/9011
${rc_nevalidni} =          006302109011

*** Test Cases ***
Test python knihovna
    ${a} =  Je Rodne Cislo  ${rc_validni} 
    ${b} =  Je Rodne Cislo  ${rc_validni_se_znaky} 
    ${c} =  Je Rodne Cislo  ${rc_nevalidni} 
    log to console          \n
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
    log to console  \n

# Je ${cislo} rodne cislo
#     ${je_rodne_cislo} =      evaluate  stdnum.cz.rc.is_valid('${cislo}')        modules=stdnum.cz.rc
#     IF  ${je_rodne_cislo}  
#         ${datum_narozeni} =  evaluate  stdnum.cz.rc.get_birth_date('${cislo}')  modules=stdnum.cz.rc
#         ${cislo_oriznute} =  evaluate  stdnum.cz.rc.compact('${cislo}')         modules=stdnum.cz.rc
#         RETURN  ${je_rodne_cislo}  ${cislo_oriznute}  ${datum_narozeni}
#     ELSE
#         ${chyba} =  Run Keyword And Expect Error  *   
#         ...    evaluate  stdnum.cz.rc.validate('${rc_nevalidni}')  modules=stdnum.cz.rc 
#         RETURN  ${False}  ${chyba}
#     END  
