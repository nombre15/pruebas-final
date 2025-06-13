*** Settings ***
Documentation       This is a Robot Framework test suite for web automation
Library           SeleniumLibrary
Library           AutoRecorder
*** Variables ***
${URL}            http://localhost:8081
${Navegador}        chrome

*** Keywords ***
Abrir Navegador y Esperar Logo
    Start Video Recording
    Open Browser    ${URL}     ${Navegador}
    Maximize Browser Window

OWNERS
    Abrir Navegador y Esperar Logo
    Click Element    xpath=/html/body/nav/div/div/ul/li[2]/a
    Page Should Contain    text=Find Owners
*** Test Cases ***
G001 ADD OWNER
    OWNERS
    Sleep    2
    Click Element    xpath=//*[@id="search-owner-form"]/a
    Sleep    2
    Input Text    xpath=//*[@id="firstName"]    John
    Input Text    xpath=//*[@id="lastName"]    Doe
    Input Text    xpath=//*[@id="address"]    123 Main St
    Input Text    xpath=//*[@id="city"]    Springfield
    Input Text    xpath=//*[@id="telephone"]    1234567890
    Click Element    xpath=//*[@id="add-owner-form"]/div[2]/div/button
    Page Should Contain    text=New Owner Created
    
G002 FIND OWNER
    OWNERS
    Sleep    2
    Click Element    xpath=//*[@id="search-owner-form"]/div[2]/div/button
    Page Should Contain    text=Owners
    Sleep     2
    Stop Video Recording