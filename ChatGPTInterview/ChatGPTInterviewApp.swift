//
//  ChatGPTInterviewApp.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/4/23.
//

import SwiftUI

@main
struct ChatGPTInterviewApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherRootView()
                .environmentObject(WeatherViewModel())
        }
    }
}
