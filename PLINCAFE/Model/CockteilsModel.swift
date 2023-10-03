//
//  CockteilsModel.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 02.10.2023.
//

import Foundation

struct Cockteil: Codable {
    let id: Int
    let name: String
    let discName: String
    let price: Int
    let image: String
}
