# *** Settings ***
# Library    SeleniumLibrary
# Library    String
# Resource   ../pages/Register.robot
# Resource   ../pages/Login.robot
# Resource   ../conf/Setup_Teardown.robot
# Test Setup    Open Chrome Browser
# Test Teardown    Close Browser

# ***Variables***




# ***Test Cases***
# Rechercher un produit en sélectionnant une catégorie incorrecte.
#     [Documentation]    Test de recherche d'un produit en sélectionnant une catégorie incorrecte
#     [Tags]  RBF008
     
#     Given L'utilisateur est sur la page de recherche 
    
#     When il entre le nom du produit
    
#     And sélectionne une catégorie incorrecte

#     And clique sur le bouton "Search"

#     Then le produit n'est pas affiché
    
#     And un texte "There is no product that matches the search criteria." s'affiche