*** Settings ***
Documentation  Zakladni Syntax Try Except

Library  String
Library  DebugLibrary
Library  SeleniumLibrary
Library  Dialogs

Resource  ../Resources/Slovnik1.robot

*** Variables ***


*** Test Cases ***
Try Except: Catch any exception
    TryExcept


*** Keywords ***
TryExcept
    TRY    
        Fail  Error 700: Fail 
    EXCEPT   Error 500: Fail 
        log to console   SPADLO: Error 500
    EXCEPT   Error 666: Fail 
        log to console   SPADLO: Error 666: Fail 
    EXCEPT 
        log to console   SPADLO: GENERIC ERROR
    ELSE 
        log to console   PROSLOOOOOO  
    END
