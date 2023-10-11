*** Settings ***
Documentation  Stringy retezce

Library  String
Library  DebugLibrary

*** Variables ***
${retezec1} =  Chapter 1
...           \nThe building was on fire, and it wasn't my fault.  
${retezec2} =  This string will be CONVERTED

*** Test Cases ***
Spravne predavani listu
    ${a} =  Convert to lower case  ${retezec2}
    ${b} =  Convert to Title Case  ${retezec2}
    ${c} =  Convert to UPPER CASE  ${retezec2}
    @{list-abc} =  Set Variable  ${a}  ${b}  ${c}
    Vypis pole po radku 1  ${list-abc}  Prvni
    Vypis pole po radku 2  @{list-abc}  Druhe
    
*** Keywords ***
Vypis pole po radku 1
    [Arguments]  ${pole}  ${nazevPole}
    ${a} =  set variable  ${1}
    FOR  ${i}  IN  @{pole}
        log to console  RADEK ${a}:
        log to console  ${i}
        ${a} =  set variable  ${a+1}
    END

Vypis pole po radku 2
    [Arguments]  @{pole}  ${nazevPole}=5
    ${a} =  set variable  1
    FOR  ${i}  IN  @{pole}
        log to console  RADEK ${a}:
        log to console  ${i}
        ${a} =  Evaluate  ${a} + 1
    END    