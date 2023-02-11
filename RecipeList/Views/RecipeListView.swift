//
//  ContentView.swift
//  RecipeList
//
//  Created by Howard Thomas on 2/9/23.
//

import SwiftUI





struct RecipeListView: View {
    //Ref the view model
    @ObservedObject var model = RecipeModel()
    
    
    var body: some View {
        NavigationView {
            
            List(model.recipes){r in
                NavigationLink(destination: RecipeDetailView(recipe: r),label: {
                    
                    // MARK: Row Item
                    HStack(spacing:20){
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50,height: 50,alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                
                    }
                })
                
            }
            .navigationTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
