//
//  WebService.swift
//  RandomChistes
//
//  Created by Brandon Alexis Martinez Cortes on 25/10/22.
//

import Foundation

enum AError: Error{
    case invalid
    case custom(error: String)
}
class WebService{
    
    var urlEnr = "https://api.chucknorris.io/"
    var random = "jokes/random"
    
    ///Get Service Item
    func Random(completion: @escaping (Result<RandomOutput, AError>) -> Void){
        guard let url = URL(string: urlEnr+random) else {
            completion(.failure(.custom(error: "URL is not correct")))
            return
        }

        let request = URLRequest(url: url)
        
        ///Request Service
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(error: "No data")))
                    
                return
            }
            ///Decode Json Random Joke
            guard let logResponse = try? JSONDecoder().decode(RandomOutput.self, from: data) else {
                completion(.failure(.custom(error: "No deserialize")))
                return
            }

            completion(.success(logResponse))
            
            
        }.resume()
        
    }
}
