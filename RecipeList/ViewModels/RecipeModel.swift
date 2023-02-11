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
}
