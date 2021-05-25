//
//  ProfileViewPage.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

struct ProfileViewPage: View {
    var menus = [
        "EditProfile" : "Edit Folder",
        "Star" : "Renew Plans",
        "Setting" : "Settings",
        "Paper" : "Terms & Privacy Policy",
        "Logout" : "Log Out"
    ]
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Profile")
                    .font(.custom("Nunito-Regular", size: 18))
                    .padding()
                
                ZStack (alignment: .bottom) {
                    Image("Avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                    
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(Color("PaleOrange"))
                                .frame(width: 32, height: 32)
                            Image("Crown")
                                .resizable()
                                .scaledToFit()
                                .frame(width:12)
                        }
                    }
                }.frame(width: 120, height: 120)
                
                Text("Shambhavi Mishra")
                    .font(.custom("Nunito-Regular", size: 24))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Food Blogger")
                    .font(.custom("Nunito-Regular", size: 16))
                    .foregroundColor(Color.black.opacity(0.5))
                
                VStack(spacing: 16.0) {
                    ForEach(0..<menus.count) { i in
                        HStack{
                            Image(menus[i].key)
                                .resizable()
                                .scaledToFit()
                                .frame(width:28)
                                .padding()
                                .background(Color("PaleOrange").opacity(0.1))
                                .cornerRadius(14)
                            
                            Text(menus[i].value)
                                .font(.custom("Nunito-Bold", size: 18))
                                .foregroundColor(Color.black.opacity(0.5))
                                .padding(.leading, 16)
                            
                            Spacer()
                            
                            Image("Arrow-Right-Light")
                                .resizable()
                                .scaledToFit()
                                .frame(width:28)
                            
                        }.frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal,24)
                .padding(.top,24)
            }
        }
    }
}

struct ProfileViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewPage()
    }
}
