//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by Howard Thomas on 2/11/23.
//

import SwiftUI

struct RecipeTabView: View {
    
    let model = RecipeModel()
    
    var body: some View {
        
        TabView{
            RecipeDetailView(recipe: model.recipes[0])
                .tabItem{
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
