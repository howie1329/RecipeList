//
//  RecipeFeaturedView.swift
//  RecipeList
//
//  Created by Howard Thomas on 2/11/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    
    @State var isDetailViewVisable = false
    @State var tapSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment:.leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top,40)
                .font(.largeTitle)
            
            GeometryReader{geo in
                
                TabView (selection:$tapSelectionIndex){
                    
                    ForEach(0..<model.recipes.count){index in
                        
                        if model.recipes[index].featured{
                            
                            //Recipe Card Button
                            Button(action: {
                                self.isDetailViewVisable = true
                            }) {
                                
                                //Recipe Card
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    
                                    VStack(spacing: 0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .clipped()
                                            .aspectRatio(contentMode: .fill)
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                                .frame(width:geo.size.width - 40, height: geo.size.height - 100,alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5,y: 5)
                            }
                            .tag(index)
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $isDetailViewVisable) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            
                        }
                    }
                    
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing:10){
                Text("Preparation Time:")
                    .font(.headline)
                Text("\(model.recipes[tapSelectionIndex].prepTime)")
                Text("Highlights")
                    .font(.headline)
                HStack {
                    ForEach(model.recipes[tapSelectionIndex].highlights, id: \.self){ item in
                        Text(item)
                    }
                }
            }
            .padding([.leading,.bottom])
            
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
