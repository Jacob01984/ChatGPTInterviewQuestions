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
    
    var conditionImage: String {
        guard let conditionText = condition?.text else {
            return "questionmark"
        }
        switch conditionText.lowercased() {
        case "sunny":
            return "sun.max.circle.fill"
        case "cloudy", "partly cloudy":
            return "cloud.sun.circle.fill"
        case "overcast":
            return "cloud.circle.fill"
        case "mist", "patchy rain possible", "patchy light drizzle", "light drizzle", "patchy light rain", "light rain":
            return "cloud.rain.circle.fill"
        case "patchy snow possible", "patchy sleet possible", "patchy freezing drizzle possible", "freezing drizzle", "heavy freezing drizzle":
            return "cloud.snow.circle.fill"
        case "thundery outbreaks possible":
            return "cloud.bolt.circle.fill"
        case "blowing snow", "blizzard":
            return "snowflake.circle.fill"
        case "fog":
            return "cloud.fog.circle.fill"
        default:
            return "questionmark"
        }
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
