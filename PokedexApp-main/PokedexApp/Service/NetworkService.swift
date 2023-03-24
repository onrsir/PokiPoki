//
//  Webservice.swift
//  PokedexApp
//
//  Created by Onur Sir on 22.03.2023.
//

import Foundation

class NetworkService{
    
    func decode<T: Decodable>(url: String, completion: @escaping (T) -> (), failure: @escaping (Error) -> ()) {
        guard let url = URL(string: url) else {
            failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                failure(error ?? NSError(domain: "Unknown error", code: 0, userInfo: nil))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            } catch let error {
                failure(error)
            }
        }.resume()
    }

    
    
    func fetchData<T: Decodable>(url: String, model: T.Type, completion: @escaping (T) -> (), failure: @escaping(Error) -> ()) {
        
        guard let url           = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data      = data else {
                if let error    = error {
                    failure(error)
                }
                return
            }
            do {
                let serverData   = try JSONDecoder().decode(T.self, from: data)
                onMain {
                    completion(serverData)
                }
            } catch {
                failure(error)
            }
        }.resume()
    }
    
    
}

func onMain(completion: @escaping () -> Void ) {
    DispatchQueue.main.async {
        completion()
    }
}
