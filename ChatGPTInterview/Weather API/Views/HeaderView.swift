//
//  HeaderView.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/7/23.
//

import SwiftUI
import CoreLocation

struct HeaderView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                
                HStack {
                    Text(viewModel.location.name ?? "San Antonio")
                        .font(.title)
                    .bold()
                    Spacer()
                    Button {
                        viewModel.getWeather(location: CLLocation(latitude: 123, longitude: 123))
                    } label: {
                        Image(systemName: "plus.circle")
                    }

                }
                Text(viewModel.location.region ?? "Texas")
                    .bold()
                Text(viewModel.location.localtime ?? "2023-08-07 9:39")
                
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

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(WeatherViewModel())
    }
}
