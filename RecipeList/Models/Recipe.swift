//
//  Recipe.swift
//  RecipeList
//
//  Created by Howard Thomas on 2/9/23.
//

import Foundation

// Model Of A Single Recipe

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
}
