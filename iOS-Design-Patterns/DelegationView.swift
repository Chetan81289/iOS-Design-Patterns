//
//  DelegationView.swift
//  iOS-Design-Patterns
//
//  Created by Chetan purohit on 07/05/26.
//

import SwiftUI

// MARK: - Delegation
// Allows one object to communicate back to another via a protocol.

protocol CharacterDelegate{
 func didTapCharacter(name: String)
}

struct CharacterView: View {
    var name: String
    var delegate: CharacterDelegate?
    var body: some View {
        Button(name){
                self.delegate?.didTapCharacter(name: self.name)
            }
    }
}


struct DelegationView: View,CharacterDelegate {
    @State private var selectedCharacter = "None"
    
    var body: some View {
        VStack(spacing: 20) {
                   Text("Delegation Pattern")
                       .font(.title.bold())
                   
                   HStack {
                       CharacterView(name: "Mario", delegate: self)
                       CharacterView(name: "Luigi", delegate: self)
                       CharacterView(name: "Peach", delegate: self)
                   }
                   
                   Text("Selected: \(selectedCharacter)")
                       .font(.title3)
               }
               .padding()
               .navigationTitle("Delegation")
    }
    func didTapCharacter(name: String) {
        selectedCharacter = name
    }
}
