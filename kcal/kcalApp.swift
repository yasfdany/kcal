//
//  kcalApp.swift
//  kcal
//
//  Created by Ya'suf Dany on 24/05/21.
//

import SwiftUI

@main
struct kcalApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}

extension View {
    func navigatePush(whenTrue toggle: Binding<Bool>) -> some View {
        NavigationLink(
            destination: self,
            isActive: toggle
        ) { EmptyView() }
    }

    func navigatePush<H: Hashable>(when binding: Binding<H>,
                                   matches: H) -> some View {
        NavigationLink(
            destination: self,
            tag: matches,
            selection: Binding<H?>(binding)
        ) { EmptyView() }
    }

    func navigatePush<H: Hashable>(when binding: Binding<H?>,
                                   matches: H) -> some View {
        NavigationLink(
            destination: self,
            tag: matches,
            selection: binding
        ) { EmptyView() }
    }
}
