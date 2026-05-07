//
//  SingletonView.swift
//  iOS-Design-Patterns
//
//  Created by Chetan purohit on 07/05/26.
//

import SwiftUI
import Combine

// MARK: - Singleton
// Ensures only one instance exists and provides a global access point.

class AppSettings: ObservableObject {
    static let shared = AppSettings()
    @Published var isDarkMode: Bool = false
    
    private init() { } // Prevents external instantiation
}

struct SingletonView: View {
    @StateObject private var appSettings: AppSettings = .shared
    var body: some View {
        VStack(spacing: 20){
            Text("Singleton Pattern")
                .font(.title.bold())
            
            Toggle("Dark Mode", isOn: $appSettings.isDarkMode)
                .padding()
                .background(appSettings.isDarkMode ? Color.black.opacity(0.2) : Color.white)
                .cornerRadius(10)
            
            Text("The singleton instance is shared across the entire app.")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Singleton")
    }
}

/*
 struct SingletonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SingletonView()
        }
    }
}
 */
 
