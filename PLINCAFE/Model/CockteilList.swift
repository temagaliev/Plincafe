//
//  CockteilList.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 03.10.2023.
//

import Foundation

struct CockteilList {
    var cockteilsArray: [Cockteil] = [Cockteil(id: 1, name: "Cocktail Oasis", discName: "gin, Blue Curacao liqueur, tonic", price: 690, image: "image1"),
                                     Cockteil(id: 2, name: "Love on the Beach", discName: "vodka, schnapps, cranberry, apple juice", price: 550, image: "image2"),
                                     Cockteil(id: 3, name: "Piranha", discName: "vodka, liqueur, Coca-Cola", price: 458, image: "image3"),
                                     Cockteil(id: 4, name: "Daiquiri", discName: "rum, lime, lemon, sugar syrup", price: 250, image: "image4"),
                                     Cockteil(id: 5, name: "Glowing cocktail", discName: "vodka, tonic, ice", price: 300, image: "image5"),
                                      Cockteil(id: 6, name: "Green Vesper", discName: "absinthe, gin, vodka, lime, ice", price: 330, image: "image6"),
                                      Cockteil(id: 7, name: "Spritz Love", discName: "liqueur, juice, ice", price: 330, image: "image7")]
    
    var nonAlcoCockteilsArray: [Cockteil] = [Cockteil(id: 8, name: "Planter's Punch", discName: "orange, pineapple, lemon juice, sugar", price: 230, image: "image8"),
                                             Cockteil(id: 9, name: "Love", discName: "liqueur, juice, ice", price: 330, image: "image9"),
                                             Cockteil(id: 10, name: "Three Crowns Collins", discName: "lemon juice, sugar, ice", price: 250, image: "image10"),
                                             Cockteil(id: 11, name: "Peat, fruit and smoke", discName: "apple juice, ice", price: 440, image: "image11"),
                                             Cockteil(id: 12, name: "The Oaxaca Old Fashioned", discName: "agava and orange juice, ice", price: 320, image: "image12"),
                                             Cockteil(id: 13, name: "Rhubarb Crumble", discName: "lime, juice, ice.", price: 350, image: "image13")]
    
    var allCockteilsArray: [Cockteil] = [Cockteil(id: 1, name: "Cocktail Oasis", discName: "gin, Blue Curacao liqueur, tonic", price: 690, image: "image1"),
                                         Cockteil(id: 2, name: "Love on the Beach", discName: "vodka, schnapps, cranberry, apple juice", price: 550, image: "image2"),
                                         Cockteil(id: 3, name: "Piranha", discName: "vodka, liqueur, Coca-Cola", price: 458, image: "image3"),
                                         Cockteil(id: 4, name: "Daiquiri", discName: "rum, lime, lemon, sugar syrup", price: 250, image: "image4"),
                                         Cockteil(id: 5, name: "Glowing cocktail", discName: "vodka, tonic, ice", price: 300, image: "image5"),
                                          Cockteil(id: 6, name: "Green Vesper", discName: "absinthe, gin, vodka, lime, ice", price: 330, image: "image6"),
                                          Cockteil(id: 7, name: "Spritz Love", discName: "liqueur, juice, ice", price: 330, image: "image7"),
                                         Cockteil(id: 8, name: "Planter's Punch", discName: "orange, pineapple, lemon juice, sugar", price: 230, image: "image8"),
                                         Cockteil(id: 9, name: "Love", discName: "liqueur, juice, ice", price: 330, image: "image9"),
                                         Cockteil(id: 10, name: "Three Crowns Collins", discName: "lemon juice, sugar, ice", price: 250, image: "image10"),
                                         Cockteil(id: 11, name: "Peat, fruit and smoke", discName: "apple juice, ice", price: 440, image: "image11"),
                                         Cockteil(id: 12, name: "The Oaxaca Old Fashioned", discName: "agava and orange juice, ice", price: 320, image: "image12"),
                                         Cockteil(id: 13, name: "Rhubarb Crumble", discName: "lime, juice, ice.", price: 350, image: "image13")]
    
}
