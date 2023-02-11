//
//  DataService.swift
//  RecipeList
//
//  Created by Howard Thomas on 2/9/23.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe]{
        
        //Parse Local json file
        
        //Get a url path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if path string is not nil, otherwise...
        guard pathString != nil else{
            return [Recipe]()
        }
        
        //Create a url object
            //Can unwrap using !
        let url =  URL(fileURLWithPath: pathString!)
        
        do{
            //Create a data object
            let data = try Data(contentsOf: url)
            
            //Decode the data witha JSON decoder
            
            let decoder = JSONDecoder()
            
            do{
                
                let recipeData =  try decoder.decode([Recipe].self, from: data)
                
                //Add the Unique ID
                for r in recipeData {
                    r.id = UUID()
                }
                
                //Return the recipes
                return recipeData
                
            }catch{
                // Error woth parsing json
                print(error)
            }
        }catch{
            //Error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
    
}
