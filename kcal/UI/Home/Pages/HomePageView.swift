//
//  HomePage.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

struct HomePageView: View {
    @State private var headlineIndex = 0
    
    init() {
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(white: 1, alpha: 0)
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(white: 1, alpha: 0)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Hello, Dany")
                        .font(.custom("Nunito-Bold", size: 24))
                        .foregroundColor(Color("Primary"))
                        .multilineTextAlignment(.leading)
                    Text("Find, track and eat heathy food.")
                        .font(.custom("Nunito-Regular", size: 18))
                        .foregroundColor(Color(.black).opacity(0.5))
                        .multilineTextAlignment(.leading)
                }.padding()
                
                TabView(selection : $headlineIndex){
                    HeadLineView().tag(0)
                    HeadLineView().tag(1)
                    HeadLineView().tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 200)
                
                HStack(){
                    Spacer()
                    ForEach(0..<3){ i in
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color("PaleOrange").opacity(self.headlineIndex == i ? 1 : 0.5))
                            .frame(width: self.headlineIndex == i ? 20 : 10, height: 10)
                    }
                    Spacer()
                }
                
                HStack{
                    Text("Track Your Weekly Progress")
                        .font(.custom("Nunito-Bold", size: 18))
                        .foregroundColor(Color(.white))
                        .multilineTextAlignment(.leading)
                    
                    Spacer().frame(width:24)
                    
                    Button(action: {
                        
                    }) {
                      HStack {
                        Spacer()
                        Text("View Now")
                            .font(.custom("Nunito-Bold", size: 14))
                            .foregroundColor(Color("Purple"))
                        Image("Arrow-Right-Purple")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .listItemTint(Color("Purple"))
                        Spacer()
                      }
                    }
                    .padding(12)
                    .background(Color(.white))
                    .contentShape(Rectangle())
                    .cornerRadius(12)
                }
                .frame(maxWidth: .infinity)
                .padding(24)
                .background(Color("Purple"))
                .cornerRadius(32)
                .padding()
                
                HStack {
                    Spacer().frame(width: 18)
                    Text("Choose Your Favorites")
                        .font(.custom("Nunito-Bold", size: 18))
                        .foregroundColor(Color(.black))
                        .multilineTextAlignment(.leading)
                }
                
                Spacer().frame(height : 24)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 18){
                        Spacer()
                        CategoryView(image: "Strawberry", name: "Fruits", color: Color("PaleOrange"))
                        CategoryView(image: "Broccolly", name: "Vegetables", color: Color("Primary"))
                        CategoryView(image: "Pizza", name: "Snacks", color: Color("Yellow"))
                    }
                }
            }
        }
    }
}

struct CategoryView : View {
    var image : String
    var name : String
    var color : Color
    
    var body : some View {
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 48)
            Text(name)
                .font(.custom("Nunito-Bold", size: 18))
                .foregroundColor(Color(.black))
        }
        .frame(width : 140,height: 160)
        .background(color.opacity(0.15))
        .cornerRadius(32)
    }
}

struct HeadLineView : View {
    var body : some View {
        HStack{
            VStack(alignment: .leading){
                Text("A R T I C L E")
                    .font(.custom("Nunito-Bold", size: 12))
                    .foregroundColor(Color("PaleOrange"))
                Text("The pros and cons of fast food.")
                    .font(.custom("Nunito-Regular", size: 18))
                    .foregroundColor(Color("DarkBrown"))
                Button(action: {
                    
                }) {
                  HStack {
                    Spacer()
                    Text("Get Started")
                        .font(.custom("Nunito-Bold", size: 14))
                        .foregroundColor(Color(.white))
                    Image("Arrow-Right")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Spacer()
                  }
                }
                .padding(12)
                .background(Color("PaleOrange"))
                .contentShape(Rectangle())
                .cornerRadius(12)
            }
            Spacer().frame(width:24)
            Image("Burger-Illustration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 140)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(Color("PaleOrange").opacity(0.15))
        .cornerRadius(32)
        .padding()
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .previewDevice("iPhone 12")
    }
}
