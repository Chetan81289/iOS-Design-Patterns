//
//  PatternListView.swift
//  iOS-Design-Patterns
//
//  Created by Chetan purohit on 07/05/26.
//

import SwiftUI

struct PatternListView: View {
    var body: some View {
        let patterns:[(String,AnyView)] = [
            ("Singleton",AnyView(SingletonView())),
            ("Factory",AnyView(FactoryView())),
            ("Observer (Combine)",AnyView(ObserverView())),
            ("Delegation",AnyView(DelegationView())),
            ("Coordinator",AnyView(CoordinatorView())),
            ("Dependency Injection",AnyView(DependencyInjectionView())),
            ("Adepter",AnyView(AdepterView())),
            ("Builder",AnyView(BuilderView())),
            ("Decorator",AnyView(DecoratorView())),
            ("Facade",AnyView(FacadeView()))
        ]
        
        List(patterns, id: \.0) { pattern in
            NavigationLink(destination: pattern.1) {
                Text(pattern.0)
                    .font(.headline)
            }
        }
        .navigationTitle("Design Patterns")
    }
}

#Preview {
    PatternListView()
}
