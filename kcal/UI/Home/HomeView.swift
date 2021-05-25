//
//  HomeView.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

struct HomeView: View {
    @State private var pageIndex = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 0.0) {
            TabView(selection : $pageIndex){
                HomePageView().tag(0)
                SearchPageView().tag(1)
                FavoritePageView().tag(2)
                ProfileViewPage().tag(3)
            }
            .tabViewStyle(PageTabViewStyle())
            
            Divider()
            
            HStack(){
                Image("Home" + (pageIndex == 0 ? "-Selected" : ""))
                    .resizable()
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        withAnimation{
                            pageIndex = 0
                        }
                    }
                Spacer()
                Image("Search" + (pageIndex == 1 ? "-Selected" : ""))
                    .resizable()
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        withAnimation{
                            pageIndex = 1
                        }
                    }
                Spacer()
                Image("Camera-Button")
                    .resizable()
                    .frame(width: 48, height: 48)
                Spacer()
                Image("Heart" + (pageIndex == 2 ? "-Selected" : ""))
                    .resizable()
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        withAnimation{
                            pageIndex = 2
                        }
                    }
                Spacer()
                Image("Profile" + (pageIndex == 3 ? "-Selected" : ""))
                    .resizable()
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        withAnimation{
                            pageIndex = 3
                        }
                    }
            }
            .padding(18)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 12 Pro")
    }
}
