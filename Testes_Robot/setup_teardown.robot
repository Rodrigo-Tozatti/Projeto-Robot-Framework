*** Settings ***
Library   SeleniumLibrary
Resource    setup_teardown.robot

*** Keywords ***
Dado que eu acesse o sistema organo
    Open Browser    http://localhost:3000/    browser=Chrome

Fechar o navegador
    Close Browser