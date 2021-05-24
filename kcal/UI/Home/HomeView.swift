//
//  HomeView.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

struct HomeView: View {
    @State private var pageIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection : $pageIndex){
                HomePageView().tag(0)
                SearchPageView().tag(1)
                FavoritePageView().tag(2)
                ProfileViewPage().tag(3)
            }
            .tabViewStyle(PageTabViewStyle())
            
            HStack(){
                Image("Home" + (pageIndex == 0 ? "-Selected" : ""))
                    .resizable()
                    .frame(width: 36, height: 36)
                Spacer()
                Image("Search" + (pageIndex == 1 ? "-Selected" : ""))
                    .resizable()
                    .frame(width: 36, height: 36)
                Spacer()
                Image("Camera-Button")
                    .resizable()
                    .frame(width: 48, height: 48)
                Spacer()
                Image("Heart" + (pageIndex == 2 ? "-Selected" : ""))
                    .resizable()
                    .frame(width: 36, height: 36)
                Spacer()
                Image("Profile" + (pageIndex == 3 ? "-Selected" : ""))
                    .resizable()
                    .frame(width: 36, height: 36)
            }
            .padding(24)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
