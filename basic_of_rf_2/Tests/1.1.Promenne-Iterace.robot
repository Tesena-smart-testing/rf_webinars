*** Settings ***
Documentation  Prace s promennymi
...            RF defaultne uklada promenne jako String

Library  String
Library  DebugLibrary

Resource  ../Resources/Obecne.robot

*** Variables ***
${a} =  1
# ${b} =  ${1}

*** Test Cases ***
Promenna vypis
    my log  ${a}    

Iterace promenne - Iterace Stringu - FAIL
    ${a} =  set variable  ${a+1}   #spadne
    my log    ${a}

Iterace promenne - Convert to Int 
    ${a} =  Convert To Integer  ${a}
    ${a} =  set variable  ${a+1}
    my log    ${a}    

Iterace promenne - python
    ${a} =  Evaluate  ${a} + 1  #bez dvojitych mezer, cele je to jeden argument
    my log    ${a}

Iterace promenne - definice jako INT
    ${b} =  Set Variable  ${1}
    my log    ${b+1}

