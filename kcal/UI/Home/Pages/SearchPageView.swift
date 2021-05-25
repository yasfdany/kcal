//
//  SearchPageView.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

struct SearchPageView: View {
    @State var searchText : String = ""
    let trendings = [
        "best vegetable recipes",
        "cool season vegetables",
        "chicken recipes with eggs",
        "soups",
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0.0){
                HStack{
                    Image("Search")
                        .resizable()
                        .scaledToFit()
                        .frame(width:18)
                    Spacer().frame(width: 14)
                    TextField("Search recipes, articles, people...",text:$searchText)
                        .font(.custom("Nunito-Regular", size: 18))
                    Spacer()
                }
                .padding(18)
                .background(Color(.black).opacity(0.05))
                .cornerRadius(12)
                .padding()
                
                Text("Hot Now")
                    .font(.custom("Nunito-Bold", size: 22))
                    .padding(.leading, 14)
                    .padding(.top,14)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 16){
                        Spacer().frame(width:4)
                        ItemArticleView(image: "Pumkin")
                        ItemArticleView(image: "Letuce")
                    }
                }
                
                Text("Trending")
                    .font(.custom("Nunito-Bold", size: 22))
                    .padding(.leading, 14)
                    .padding(.top,14)
                    .padding(.bottom,14)
                
                ForEach(trendings,id: \.self) {trend in
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text(trend)
                                .font(.custom("Nunito-Regular", size: 18))
                                .foregroundColor(Color("PaleOrange"))
                            Image("Trend")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:8)
                        }.padding(.top,14)
                        Divider()
                    }.onTapGesture {
                        self.searchText = trend
                    }
                }
                .padding(.leading,14)
            }
        }
    }
}

struct ItemArticleView : View {
    var image: String
    let screenBound = UIScreen.main.bounds
    
    var body : some View{
        VStack(alignment: .leading){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:screenBound.width * 0.56, height: 160)
                .cornerRadius(0)
            Text("The Pumkins Secrets")
                .font(.custom("Nunito-Bold", size: 18))
                .padding(.leading,12)
            Text("Lorem ipsum dolor sit amet ipsum dolor sit amet")
                .font(.custom("Nunito-Regular", size: 16))
                .padding(.leading,12)
            Spacer()
        }
        .background(Color.white)
        .frame(width:screenBound.width * 0.56, height: 240)
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.1),radius: 12)
        .padding(.top)
        .padding(.bottom)
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
