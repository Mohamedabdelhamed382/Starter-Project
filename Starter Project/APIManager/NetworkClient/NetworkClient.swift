//
//  NetworkClient.swift
//  Starter Project
//
//  Created by MOHAMED ABD ELHAMED AHMED on 27/03/2023.
//

import Foundation

// APIError enum which shows all possible Network errors
enum APIError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
    case badURL(String)
}

// Result enum to show success or failure
enum Result<T> {
    case success(T)
    case failure(APIError)
}

class NetworkClient{
    
    static let networkClient = NetworkClient()

    private init () {}
    
    // dataRequest which sends request to given URL and convert to Decodable Object
    func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
        
        // create the url with NSURL
        guard let dataURL = URL(string: url) else {
           completion(.failure(APIError.badURL(url)))
           return
        }
        
        // create the session object
        let session = URLSession.shared
        
        // now create the URLRequest object using the url object
        let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        
        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(Result.failure(APIError.networkError(error!)))
                return
            }
            
            guard let data = data else {
                completion(Result.failure(APIError.dataNotFound))
                return
            }
            do {
                // create decodable object from data
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                completion(Result.failure(APIError.jsonParsingError(error as! DecodingError)))
            }
        })
        
        task.resume()
    }
    
    
    
    
}
