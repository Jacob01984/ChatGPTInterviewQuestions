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
                Text(currentWeather.condition?.text ?? "Sunny")
                Text("\(currentWeather.feelsLikeF ?? 102.3)")
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(.thinMaterial)
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(currentWeather: CurrentWeather())
    }
}
