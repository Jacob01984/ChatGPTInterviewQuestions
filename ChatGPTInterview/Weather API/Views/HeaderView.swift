//
//  HeaderView.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/7/23.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                
                Text(viewModel.location.name ?? "San Antonio")
                    .font(.title)
                    .bold()
                Text(viewModel.location.region ?? "Texas")
                    .bold()
                Text(viewModel.location.localtime ?? "2023-08-07 9:39")
                
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(.thinMaterial)
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
