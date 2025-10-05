*** Settings ***
Library    SeleniumLibrary

**Variables***
${Url}   https://tutorialsninja.com/demo

***Keywords***
Open Chrome Browser 
    [Documentation]   Ouvre le site dans le navigateur Chrome
    SeleniumLibrary.Open Browser  url=${Url}  browser=Chrome
    SeleniumLibrary.Maximize Browser Window
    
Close Browser
    [Documentation]   Ferme le navigateur
    Capture Page Screenshot  selenium-screenshot-{index}.png
    SeleniumLibrary.Close Browser