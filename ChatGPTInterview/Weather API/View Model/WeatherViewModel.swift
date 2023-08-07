//
//  WeatherViewModel.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/6/23.
//

import Foundation
import CoreLocation


class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    
    @Published var location = Location()
    @Published var currentWeather = CurrentWeather()
    @Published var forecast = Forecast()
    
    override init() {
        //init method of NSObject
        super.init()
        
        //set content model as the delegate of the location manager
        locationManager.delegate = self
        
        //request permission
        locationManager.requestWhenInUseAuthorization()
        
        //start geolocating the user
        locationManager.startUpdatingLocation()
    }
    //location manager delegate methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        //update the authorization property
        authorizationState = locationManager.authorizationStatus
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            //locationManager.startUpdatingLocation()
            
        } else if locationManager.authorizationStatus == .denied {
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //gives up location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            //stop request for location after we get it once
            locationManager.stopUpdatingLocation()
            
            //if we have the coordinates of the user, send into weather API
            getWeather(location: userLocation!)
            print(userLocation!)
        }
        
    }
    
    //http://api.weatherapi.com/v1/forecast.json?key=f165fd7a979643a1903222454230608&q=+37.33659906,-122.08220411&days=5&aqi=no&alerts=no
    
    func getWeather(location: CLLocation) {
        
        let apiUrl = "https://api.weatherapi.com/v1/forecast.json?"
        
        let coords = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
        
        var urlComponents = URLComponents(string: apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: Constants.apiKey),
            URLQueryItem(name: "q", value: String(coords)),
            URLQueryItem(name: "days", value: "5"),
            URLQueryItem(name: "aqi", value: "no"),
            URLQueryItem(name: "alerts", value: "no")
        ]
        let url = urlComponents?.url
        
        if let url = url {
            print(url)
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error in data task: \(error.localizedDescription)")
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(WeatherSearch.self, from: data)
                        
                        
                        DispatchQueue.main.async {
                            self.location = result.location
                            self.currentWeather = result.current
                            self.forecast = result.forecast
                        }
                        
                        
                        print(self.location)
                        print(self.currentWeather)
                        print(self.forecast)
                        
                    } catch {
                        print("Error in JSON decoding: \(error)")
                    }
                } else {
                    print("No data received from server")
                }
            }
            dataTask.resume()
        } else {
            print("Error in URL")
        }
    }
    
    
}
















//class ContentModel: NSObject, ObservableObject {
//
//    @Published var posts = [PostData]()
//
//    func getPosts() {
//
//        guard let url = URL(string: Constants.apiUrl) else { return }
//
//            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
//            request.httpMethod = "GET"
//
//            let session = URLSession.shared
//
//        let dataTask = session.dataTask(with: request) { (data, response, error) in
//
//                if let error = error {
//                    print("Error: \(error.localizedDescription)")
//                    return
//                }
//                guard let data = data else {
//                    print("No data recieved")
//                    return
//                }
//                do {
//                    let decoder = JSONDecoder()
//                    let result = try decoder.decode([PostData].self, from: data)
//
//                    DispatchQueue.main.async {
//                        self.posts = result
//                    }
//                } catch let decodingError {
//                    print("Decoding failed: \(decodingError.localizedDescription)")
//                }
//
//            }
//            dataTask.resume()
//    }
//
//}
