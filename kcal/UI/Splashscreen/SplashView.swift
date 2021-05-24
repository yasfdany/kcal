//
//  ContentView.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color("Primary").ignoresSafeArea()
            VStack{
                Spacer()
                Text("kcal")
                    .font(.custom("Nunito-Bold", size: 76))
                    .foregroundColor(.white)
                Spacer()
                Text("ZUMAICA")
                    .font(.custom("Nunito-Regular", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white.opacity(0.5))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
