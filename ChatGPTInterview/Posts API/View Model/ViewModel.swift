//
//  ViewModel.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/4/23.
//

import Foundation

class ContentModel: NSObject, ObservableObject {
    
    @Published var posts = [PostData]()
    
    func getPosts() {
        
        guard let url = URL(string: Constants.apiUrl) else { return }
        
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            
            let session = URLSession.shared
            
        let dataTask = session.dataTask(with: request) { (data, response, error) in

                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                guard let data = data else {
                    print("No data recieved")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([PostData].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.posts = result
                    }
                } catch let decodingError {
                    print("Decoding failed: \(decodingError.localizedDescription)")
                }
                
            }
            dataTask.resume()
    }
    
}
