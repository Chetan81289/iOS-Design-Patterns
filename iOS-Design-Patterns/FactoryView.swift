//
//  FactoryView.swift
//  iOS-Design-Patterns
//
//  Created by Chetan purohit on 07/05/26.
//

import SwiftUI

// MARK: - Factory
// Creates objects without specifying the exact class, promoting loose coupling.

protocol Shape {
    func draw() -> String
}

struct Circle: Shape {
    func draw() -> String {
        "○ Circle"
    }
}

struct Square: Shape {
    func draw() -> String {
        "□ Square"
    }
}

struct Triangle: Shape {
    func draw() -> String {
        "▲ Triangle"
    }
}

enum ShapeType: String {
    case circle = "Circle"
    case square = "Square"
    case triangle = "Triangle"
}

class ShapeFactoryClass {
    static func createShape(_ type: ShapeType)-> Shape {
        switch type {
        case .circle:
            return Circle()
        case .square:
            return Square()
        case .triangle:
            return Triangle()
        }
    }
}

struct FactoryView: View {
    @State private var drawnShape = ""
    var body: some View {
        VStack(spacing: 20) {
            Text("Factory Pattern")
                .font(.title.bold())
            
            HStack{
                ForEach([ShapeType.circle, .square, .triangle], id: \.self) { type in
                    Button(type.rawValue.capitalized) {
                        let shape = ShapeFactoryClass.createShape(type)
                        shape.draw()
                        drawnShape = type.rawValue.capitalized
                    }
                    .buttonStyle(.bordered)
                }
            }
            Text("Drawn: \(drawnShape)")
                .font(.title3)
        }
        .padding()
        .navigationTitle("Factory")
    }
}
