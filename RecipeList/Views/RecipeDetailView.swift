//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Howard Thomas on 2/10/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 380,height: 200, alignment: .center)
                    .clipped()
                    .cornerRadius(10)
                
                Text(recipe.name)
                    .bold()
                    .padding(.top,10)
                    .padding(.leading)
                    .font(.largeTitle)
                
                // MARK: Serving Size Picker
                VStack(alignment:.leading) {
                    Text("Serving Size")
                    Picker("", selection: $selectedServingSize){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(.segmented)
                    .frame(width:160)
                }
                .padding()
                
                Divider()
                
                // MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    
                    ForEach (recipe.ingredients){ item in
                        Text("\(RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize)) \(item.name.lowercased())")
                            .padding(.bottom, 2)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                // MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    
                    ForEach(0..<recipe.directions.count, id:\.self){item in
                        Text("\(item + 1). \(recipe.directions[item])")
                            .padding(.bottom, 5)
                    }
                }.padding(.horizontal)
                
            }.padding(.horizontal,10)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass it into the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
