//
//  ObserverView.swift
//  iOS-Design-Patterns
//
//  Created by Chetan purohit on 07/05/26.
//

import SwiftUI
import Combine

// MARK: - Observer (via Combine)
// An observable object notifies subscribers when its state changes.
class TimerModel: ObservableObject {
    @Published var count: Int = 0
   private var timer: AnyCancellable?
    
  func start() {
      stop()  // avoid multiple timers
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.count += 1
            }
    }
    func stop() {
        timer?.cancel()
        timer = nil
    }
}

struct ObserverView: View {
    @StateObject private var timerModel = TimerModel()
    var body: some View {
        VStack(spacing:20) {
            Text("Observer Pattern\n(Combine)")
                .font(.title.bold())
                .multilineTextAlignment(.center)
            
            Text("Seconds: \(timerModel.count)")
                .font(.system(size: 50,design: .monospaced))
            
            HStack(spacing: 20) {
                Button("Start") {
                    timerModel.start()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Stop") {
                    timerModel.stop()
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .navigationTitle("Observer")
    }
}
