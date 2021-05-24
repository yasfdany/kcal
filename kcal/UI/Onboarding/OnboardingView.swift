//
//  OnboardingView.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

struct OnboardingView: View {
    @State var isActive:Bool = false
    @State private var onboardingIndex = 0
    
    let screenBound = UIScreen.main.bounds
    var onboardingTexts = [
        "Eat Healthy" : "Maintaining good health should be the primary focus of everyone.",
        "Healthy Recipes" : "Browse thousands of healthy recipes from all over the world.",
        "Track Your Health" : "With amazing inbuilt tools you can track your progress."
    ]
    
    var body: some View {
        VStack{
            if self.isActive {
                Spacer().frame(height: 24)
                Text("kcal")
                    .font(.custom("Nunito-Regular", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color("Primary"))
                Spacer()
                TabView(selection : $onboardingIndex){
                    ForEach(0..<3){ i in
                        VStack{
                            Image("Onboarding-\(3-i)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: screenBound.width * 0.8)
                            
                            Text(onboardingTexts[i].key)
                                .font(.custom("Nunito-Bold", size: 24))
                                .foregroundColor(Color(.black))
                            
                            Spacer().frame(height : 8)
                            
                            Text(onboardingTexts[i].value)
                                .font(.custom("Nunito-Regular", size: 18))
                                .foregroundColor(Color(.black).opacity(0.5))
                                .multilineTextAlignment(.center)
                                .frame(width: screenBound.width * 0.8)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                
                HStack{
                    ForEach(0..<3){ i in
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color("PaleOrange").opacity(self.onboardingIndex == i ? 1 : 0.5))
                            .frame(width: self.onboardingIndex == i ? 20 : 10, height: 10)
                    }
                }
                
                Spacer().frame(height:46)
                Button(action: {
                    
                }) {
                  HStack {
                    Spacer()
                    Text("Get Started")
                        .font(.custom("Nunito-Bold", size: 18))
                        .foregroundColor(Color(.white))
                    Spacer()
                  }
                }
                .frame(width: screenBound.width * 0.8)
                .padding(18)
                .background(Color("Primary"))
                .contentShape(Rectangle())
                .cornerRadius(12)
                
                Spacer().frame(height: 14)
                
                HStack{
                    Text("Already Have An Acount?")
                        .font(.custom("Nunito-Regular", size: 16))
                        .foregroundColor(Color(.black).opacity(0.7))
                    Text("Log In")
                        .font(.custom("Nunito-Bold", size: 16))
                        .foregroundColor(Color("Primary"))
                }
                
                Spacer()
            } else {
                SplashView()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewDevice("iPhone 12")
    }
}

extension Dictionary{
    public subscript(i: Int) -> (key: Key, value: Value) {
        get {
            return self[index(startIndex,offsetBy: i)]
        }
    }
}
