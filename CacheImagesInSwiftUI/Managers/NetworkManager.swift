//
//  NetworkManager.swift
//  CacheImagesInSwiftUI
//

import SwiftUI

enum NetworkState {
    case loaded
    case loadingError
    case loading
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func downloadImage(from stringUrl: String, completion: @escaping (_ image: UIImage?, _ networkState: NetworkState) -> ()) {
        
        guard let url = URL(string: stringUrl) else {
            completion(nil, .loadingError)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data,
                  let image = UIImage(data: data),
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                      print("Error downloading data")
                      completion(nil, .loadingError)
                      return
                  }
            
            completion(image, .loaded)
        }
        .resume()
        
    }
    
}
