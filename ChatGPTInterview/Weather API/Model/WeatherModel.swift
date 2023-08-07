//
//  WeatherModel.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/6/23.
//

import Foundation

struct WeatherSearch: Decodable {
    var location = Location()
    var current = CurrentWeather()
    var forecast = Forecast()
}

struct Location: Decodable {
    var name: String?
    var region: String?
    var country: String?
    var localtime: String?
}

struct CurrentWeather: Decodable {
    var tempF: Double?
    var tempC: Double?
    var feelsLikeF: Double?
    var feelsLikeC: Double?
    var humidity: Int?
    var precipMm: Double?
    var precipIn: Double?
    var condition: Condition?
    
    enum CodingKeys: String, CodingKey {
        case tempF = "temp_f"
        case tempC = "temp_c"
        case feelsLikeF = "feelslike_f"
        case feelsLikeC = "feelslike_c"
        case humidity
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case condition
    }
}

struct Condition: Decodable {
    var text: String
}

struct Forecast: Decodable {
    var forecastday: [ForecastDay]?
}

struct ForecastDay: Decodable {
    var date: String?
    var day: Day?
}

struct Day: Decodable {
    var minTempF: Double?
    var minTempC: Double?
    var maxTempF: Double?
    var maxTempC: Double?
    var averageTempF: Double?
    var averageTempC: Double?
    var chanceOfRain: Int?
    var condition: Condition?
    
    enum CodingKeys: String, CodingKey {
        case minTempF = "mintemp_f"
        case minTempC = "mintemp_c"
        case maxTempF = "maxtemp_f"
        case maxTempC = "maxtemp_c"
        case averageTempF = "avgtemp_f"
        case averageTempC = "avgtemp_c"
        case chanceOfRain = "daily_chance_of_rain"
        case condition
    }
}
