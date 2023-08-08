//
//  WeatherRootView.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/7/23.
//

import SwiftUI
import CoreLocation
import _MapKit_SwiftUI

struct WeatherRootView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.white, .blue, .blue], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            ScrollView {
                HeaderView()
                    .padding(.top, 20)
                    .padding(.horizontal)
                
                CurrentWeatherView(currentWeather: viewModel.currentWeather)
                    .padding(.horizontal)
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
