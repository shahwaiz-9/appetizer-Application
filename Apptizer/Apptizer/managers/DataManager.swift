//
//  DataManager.swift
//  Apptizer
//
//  Created by Dev on 06/08/2024.
//

import UIKit
import SwiftUI

final class NetworkManager{
    
    static let Networkmanager = NetworkManager() // Making class singleton meaning the object of this class will only make one time
    private let cache = NSCache<NSString, UIImage>() // create a hashmap
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private init(){}
    
//    func getappitizers( completed: @escaping (Result<[appitzier], APEROOR>) -> Void){ // This line is saying this func
//        // Will return either the data or error
//        
//        
//        // Checking the URL if it is able to convert from string to url
//        
//        guard let url = URL(string: NetworkManager.baseURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            // The upper line is the get request via verified url in techniqal terms (get method)
//            
//            // If there is network issue and the call has not been made
//            if let _ = error {
//                completed(.failure(.Unable))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
//                
//                // If response is not equal to nill than take it as Http response
//                // in HTTP 200 response means everything went smooth
//                
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else{
//                completed(.failure(.invaliData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let decoderesponse = try decoder.decode(Another.self, from: data)
//                completed(.success(decoderesponse.request))
//            } catch{
//                print("The error is \(error.localizedDescription)")
//                completed(.failure(.invaliData))
//               
//            }
//            
//        }
//       
//        task.resume()
//    }
    
    func getappitizers() async throws -> [appitzier]{
        
        
        // Checking the URL if it is able to convert from string to url
        
        guard let url = URL(string: NetworkManager.baseURL) else {
            throw APEROOR.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = try JSONDecoder().decode(Another.self, from: data)
            return decoder.request
        } catch{
            throw APEROOR.invaliData
        }
    }
    
    func downloadingImage(passedString: String, completed: @escaping(UIImage?) -> Void){ // It can be null or UIImage
        
        let cachekey = NSString(string: passedString)
        if let image = cache.object(forKey: cachekey){
            completed(image)
            return
        }
        
        guard let url = URL(string: passedString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let Data  = data , let Downloaded = UIImage(data: Data) else {
                completed(nil)
                return
            }
            self.cache.setObject(Downloaded, forKey: cachekey) // Making entry
        }
        
        task.resume() // is sy network calling ka process shru hota ha isi waja sy image download nhi ho rahi thi
    }
    
    func getimage(urlstring: String) -> Image{
        let cachekey = NSString(string: urlstring)
        
        if let image = cache.object(forKey: cachekey){
            let image1 = Image(uiImage: image)
            return image1
        }
        return Image("")
    }
    
}
