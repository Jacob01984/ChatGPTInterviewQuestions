//
//  CurrentWeatherView.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/7/23.
//

import SwiftUI

struct CurrentWeatherView: View {
    var currentWeather: CurrentWeather
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    VStack {
                        Text("\(currentWeather.tempF?.formatted(withDecimalPlaces: 0) ?? "100")℉")
                            .font(.largeTitle)
                            .bold()
                        Text(currentWeather.condition?.text ?? "Sunny")
                            .font(.title2)
                    }
                    Divider()
                    
                    Image(systemName: currentWeather.conditionImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.horizontal)
                    Spacer()
                }
                .padding(30)
                Divider()
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Feels Like: ")
                            .bold()
                        Text("\(currentWeather.feelsLikeF?.formatted(withDecimalPlaces: 0) ?? "100")℉")
                    }
                    .font(.title3)
                    
                    
                    HStack {
                        Text("Humidity: ")
                            .bold()
                        Text("\(currentWeather.humidity ?? 0)%")
                    }
                    .font(.title3)
                    
                    HStack {
                        Text("Rain: ")
                            .bold()
                        Text("\(currentWeather.precipIn?.formatted(withDecimalPlaces: 1) ?? "0") In.")
                    }
                    .font(.title3)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(.regularMaterial)
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(currentWeather: CurrentWeather())
    }
}
