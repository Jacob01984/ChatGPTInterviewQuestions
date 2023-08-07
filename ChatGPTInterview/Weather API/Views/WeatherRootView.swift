//
//  WeatherRootView.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/7/23.
//

import SwiftUI

struct WeatherRootView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.white, .blue, .blue], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                HeaderView()
                    .padding(.horizontal)
                CurrentWeatherView(currentWeather: viewModel.currentWeather)
                
                Spacer()
            }
        }
        
    }
}

struct WeatherRootView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRootView()
            .environmentObject(WeatherViewModel())
    }
}
