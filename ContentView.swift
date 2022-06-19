//
//  ContentView.swift
//  WaterIntakeSettings
//
//  Created by Marko Zivanovic on 19.6.22..
//

import SwiftUI

struct ContentView: View {
    
    @State private var waterIntake = 2.0
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("The desired amount of water")
                            .font(.headline)
                        
                        Stepper("\(waterIntake.formatted())", value: $waterIntake, in: 0...10, step: 0.05)
                    }
                } header: {
                    Text("Choose the amount of water you want to take during the day")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
  }
}
