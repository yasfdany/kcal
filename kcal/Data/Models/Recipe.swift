//
//  Recipe.swift
//  kcal
//
//  Created by Ya'suf Dany on 25/05/21.
//

class Recipe : Identifiable{
    let id : Int
    let name : String
    let calory : Int
    let image : String
    let category : String
    
    init(
        id: Int,
        name: String,
        calory: Int,
        image: String,
        category: String
    ) {
        self.id = id
        self.name = name
        self.calory = calory
        self.image = image
        self.category = category
    }
}
