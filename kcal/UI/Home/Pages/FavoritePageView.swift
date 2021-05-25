//
//  FavoritePageView.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

struct FavoritePageView: View {
    @State private var pageIndex = 0
    var recipes : Array<Recipe> = []
    var foods = [
        "Cupcake",
        "Burger",
        "Pizza-Vert",
        "Cookie",
        "Hotdog",
        "",
    ]
    
    init() {
        let ramen : Recipe = Recipe(id: 0, name: "Chopped Spring Ramen", calory: 250, image: "Ramen", category: "Scallions & tomatoes")
        let chicken : Recipe = Recipe(id: 1, name: "Chicken Tandoori", calory: 450, image: "Chicken", category: "Chicken & Salad")
        
        recipes.append(ramen)
        recipes.append(chicken)
    }
    
    var body: some View {
        VStack{
            Text("Favorites")
                .font(.custom("Nunito-Regular", size: 18))
                .padding()
            
            HStack(spacing: 0){
                HStack {
                    Text("Food")
                        .font(.custom("Nunito-Bold", size: 18))
                        .foregroundColor(self.pageIndex == 0 ? .white : Color("PaleOrange"))
                }
                .frame(maxWidth:.infinity)
                .padding()
                .background(self.pageIndex == 0 ? Color("PaleOrange") : Color("Yellow").opacity(0.2))
                .onTapGesture {
                    withAnimation{
                        self.pageIndex = 0
                    }
                }
                
                HStack {
                    Text("Recipes")
                        .font(.custom("Nunito-Bold", size: 18))
                        .foregroundColor(self.pageIndex == 1 ? .white : Color("PaleOrange"))
                }
                .frame(maxWidth:.infinity)
                .padding()
                .background(self.pageIndex == 1 ? Color("PaleOrange") : Color("Yellow").opacity(0.2))
                .onTapGesture {
                    withAnimation{
                        self.pageIndex = 1
                    }
                }
                
            }
            .cornerRadius(14)
            .padding(.horizontal,18)
            .padding(.vertical,12)
            
            TabView(selection : $pageIndex){
                ScrollView(.vertical,showsIndicators: false){
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 18), count: 3),spacing: 18) {
                        ForEach(foods, id: \.self){ image in
                            HStack {
                                Image(image.isEmpty ? "Add" : image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 64, height: 64)
                            }
                            .frame(maxWidth:.infinity)
                            .padding(.vertical,24)
                            .background(Color("Yellow").opacity(0.2))
                            .cornerRadius(16)
                        }
                    }
                }
                .padding(14)
                .tag(0)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 16.0){
                        ForEach(recipes,id : \.id){ recipe in
                            HStack(alignment: .center){
                                Image(recipe.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 82)
                                
                                VStack(alignment: .leading){
                                    Text("\(recipe.calory) Kcal")
                                        .font(.custom("Nunito-Bold", size: 16))
                                        .foregroundColor(Color("Primary"))
                                    
                                    Text(recipe.name)
                                        .font(.custom("Nunito-Bold", size: 18))
                                    
                                    Text(recipe.category)
                                        .font(.custom("Nunito-Regular", size: 16))
                                        .foregroundColor(Color.black.opacity(0.3))
                                }
                                Spacer()
                            }
                            .padding(24)
                            .frame(maxWidth:.infinity)
                            .background(Color("Primary").opacity(0.3))
                            .cornerRadius(16)
                        }
                    }
                }
                .listStyle(InsetListStyle())
                .padding(14)
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct FavoritePageView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePageView()
            .previewDevice("iPhone 12")
    }
}
