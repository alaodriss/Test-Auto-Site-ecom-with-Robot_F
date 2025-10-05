***Settings*** 
Library    SeleniumLibrary
Library    String

**Variables***
${Url_search}  https://tutorialsninja.com/demo/index.php?route=product/search

${name_product}  iMAC
${xpath_input_search}  //input[@id="input-search"]

***Keywords***

go to page search 
    [Documentation]   aller vers la page de recherche
    SeleniumLibrary.Go To    ${Url_search}
    Sleep  5s    

Enter name product
    [Documentation]   saisir le nom du produit
    [Arguments]   ${name_product}
    SeleniumLibrary.Input Text    locator=${xpath_input_search}     text=${name_product}
    Sleep  5s

Selectionne category
    [Documentation]   sélectionner la catégorie du produit 
    [Arguments]   ${category_value}
    SeleniumLibrary.Select From List By Value    xpath=//select[@name='category_id']    ${category_value}
    Sleep  5s

Click in btn Search
    [Documentation]   cliquer sur le bouton Search
    SeleniumLibrary.Click Element  locator=//input[@id='button-search']
    Sleep  5s

Check product is displayed in search results
    [Documentation]   vérifier que le produit est affiché dans les résultats de la recherche
    [Arguments]  ${message} 
    Page Should Contain     ${message}