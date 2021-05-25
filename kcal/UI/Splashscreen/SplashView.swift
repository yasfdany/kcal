//
//  ContentView.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack{
            VStack {
                Text("kcal")
                    .font(.custom("Nunito-Bold", size: 76))
                    .foregroundColor(.white)
            }.frame(maxHeight:.infinity)
            Spacer()
            Text("ZUMAICA")
                .font(.custom("Nunito-Regular", size: 18))
                .fontWeight(.bold)
                .foregroundColor(.white.opacity(0.5))
                .padding(.bottom,32)
        }
        .frame(maxWidth: .infinity, maxHeight:.infinity)
        .background(Color("Primary"))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
