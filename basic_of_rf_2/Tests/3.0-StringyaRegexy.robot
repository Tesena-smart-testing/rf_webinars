*** Settings ***
Documentation  Stringy retezce

Library  String
Library  DebugLibrary

Library  OperatingSystem

Resource  ../Resources/Obecne.robot

*** Variables ***
${retezec1} =  Chapter 1
...           \n   The building was on fire, and it wasn't my fault.  #Pozor nebere se jako 2 radky v retezci 
${retezec2} =  This string will be CONVERTED
${retezec3} =  Item:  Ahoj
${cesta} =  ../Data/example1.json


*** Test Cases ***
Rozdelovani retezcu
    ${a} =  Split String  ${retezec1}  \n  
    my log  ${a}[0]
    my log  ${a}[1]
    
Orezavani retezcu
    ${a} =  Remove String  ${retezec3}  Item:
    my log   ---${a}---
    my log   ---${a.strip()}---

Nahrazeni v retezci
    ${a} =  Replace String  ${retezec3}  Item:  Predmet:
    my log  ${a}

Vse male
    # Pass Execution  Skip
    ${a} =  Convert to lower case  ${retezec2}
    ${c} =  Convert to UPPER CASE  ${retezec2}
    ${b} =  Convert to Title Case  ${retezec2}
    my log  lower case: ${a}
    my log  UPPET CASE: ${b}
    my log  Title Case: ${c}
        

Regexy
    ${json} =     getFile  Resources\\Data\\example1.json 
    log to console  ${json}
    Get regexp matches  ${json}  [0-9]{1,2}/[0-9]{1,2}/[0-9]{4}        #regex na datum, D a M vzdy 2 cifry
    Get regexp matches  ${json}  [0-1]?[0-12]/[0-3]?[0-9]/[0-9]{4}     #vime, ocekavame prvni mesic, mesic i den 1-2 cifry
    Get regexp matches  ${json}  [0-9]{1,2}[/-][0-9]{1,2}[/-][0-9]{4}  # /- oboji prijatelne oddelovace
    Replace String Using Regexp  ${json}  [0-9]{1,2}[/-][0-9]{1,2}[/-][0-9]{4}    Datum
