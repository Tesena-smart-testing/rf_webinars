*** Settings ***
Documentation  Moznost zapisu pod sebe
...            Diky trem teckam
...            Je brano jako jeden radek
...            moznost zapisu i v argumentech, dalsi ukazky jsou videt v dalsich souborech (vcetne resources)

Library  String
Library  DebugLibrary

Resource  ../Resources/Obecne.robot

*** Variables ***
${retezec1} =  My place is basically a cave with two chambers. 
...            The larger one was my living area. Bookshelves lined most of the walls,
...            and where they didn't I had hung a couple of tapestries and an original Star Wars movie poster. 
...            I'd scattered rugs all over my floor. I had laid down everything from handmade Navajo rugs to a black area rug 
...            with Elvis's face, fully two feet across, dominating the piece. Like the Beetle, I figured some people would call my ragtag assembly of floor coverings eclectic. I just thought of them as something to walk on besides freezing-cold stone floor.

@{pole} =  ROBOT  
...        TXT  
...        PYTHON  
...        CPP  
...        AVI  IMG   GIF  PNG   


*** Test Cases ***


