//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Howard Thomas on 2/9/23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init(){
        
        // Create an instance of Data service and get the data
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings:Int) -> String{
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // Get a single serving size by multipying denominator by the recipe servings
            denominator = denominator * recipeServings
            
            // Get target portion by multiplying numerator by the target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            
            //Get the whole portion if numerator > denominator
            
            if numerator >= denominator{
                
                // Calculated Whole Portions
                wholePortions = numerator / denominator
                // Calculate the remainder
                numerator = numerator % denominator
                
                // Assign to portion string
                portion += String(wholePortions)
                
            }
            
            // Express the remainder as a fraction
            
            if numerator > 0{
                // Assign remainder as fraction to portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = ingredient.unit{
            
            
            if wholePortions > 1 {
                
                //Calculate appropriate suffix
                if unit.suffix(2) == "ch"{
                    unit += "es"
                }
                else if unit.suffix(1) == "f"{
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else{
                    unit += "s"
                }
            }
            
            
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
            
        }
        
        return portion
    }
}
