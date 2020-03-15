//
//  NetworkApiManager.swift
//  NewTestIOS
//
//  Created by Borqs India on 15/03/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import Foundation

class NetworkApiManager: NSObject{
    static let sharedNetworkApiManager = NetworkApiManager()
    
    func getDataFromUrl<T: Decodable>(_ urlPath: String, completion: @escaping (T?, _ err: Error?) -> ()){
        let session = URLSession.shared
        guard let url = URL(string: urlPath) else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                completion(nil, error)
                return
            }
            if let res = response as? HTTPURLResponse{
                if res.statusCode == 200{
                guard let dt = data else {
                    print("Error in Data API")
                    return
                }
                do{
                    let str = String(decoding: dt, as: UTF8.self)
                    let dd = str.data(using: .utf8)
                    if let data = dd{
                        let obj = try JSONDecoder().decode(T.self, from: data)
                        completion(obj, nil)
                    }
                   
                } catch let jsonError{
                    completion(nil, jsonError)
                }
                }else{
                    //Handle Specific Error Codes
                }
            }
        }
        task.resume()
    }
}
