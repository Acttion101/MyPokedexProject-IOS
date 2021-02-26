//
//  APIManager.swift
//  MyPokedexProject
//
//  Created by pongpon on 25/2/2564 BE.
//

import Foundation

class AppleAPIManager: NSObject {
    
    func getData(url: URL, completion: @escaping (Any?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            DispatchQueue.main.async {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(json)
                } catch {
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
}
