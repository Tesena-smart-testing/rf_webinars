*** Settings ***
Documentation  Moznost nacteni hodnoty do promenne ze souboru

Library  String
Library  DebugLibrary
Library  OperatingSystem

Resource  ../Resources/Obecne.robot

*** Variables ***
${cesta} =  ../Data/example1.json
${tbd} =    AHOOOOOOOOOOOOOOOOOOOOOOOOOJ

*** Test Cases ***
Nacteni souboru s promennou
    ${json} =     getFile  Resources\\Data\\example1.json 
    ${json} =     Convert To String  ${json}
    log to console  ${json}

# ...    ${json} =     getFile     Resources\\Client\\DateLetter.txt