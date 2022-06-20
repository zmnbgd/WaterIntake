//
//  ContentView.swift
//  WaterIntakeSettings
//
//  Created by Marko Zivanovic on 19.6.22..
//

import SwiftUI

struct ContentView: View {
    
    @State private var getNotification = false
    
    @State private var beginning = defaultBeginningTime
    @State private var completion = defaultCompletionTime
    
    @State private var waterIntake = 2.0
    
    static var defaultBeginningTime: Date {
        var beginningTimeComponents = DateComponents()
        beginningTimeComponents.hour = 8
        beginningTimeComponents.minute = 0
        
        return Calendar.current.date(from: beginningTimeComponents) ?? Date.now
    }
    
    static var defaultCompletionTime: Date {
        var completionTimeComponents = DateComponents()
        completionTimeComponents.hour = 21
        completionTimeComponents.minute = 0
        
        return Calendar.current.date(from: completionTimeComponents) ?? Date.now
    }
    
    
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
                
                Section(header: Text("Beginning intake time interval")) {
                   
                    DatePicker("Plese enter the time", selection: $beginning, displayedComponents: .hourAndMinute)
                        .font(.headline)
                }
                
                Section(header: Text("Completion intake time interval")) {
                   
                    DatePicker("Plese enter the time", selection: $completion, displayedComponents: .hourAndMinute)
                        .font(.headline)
                }
                
                Section(header: Text("Notification")) {
                    Toggle("Send notification", isOn: $getNotification)
                        .font(.headline)

                }
                
        }
            .navigationTitle("Settings")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
  }
}
