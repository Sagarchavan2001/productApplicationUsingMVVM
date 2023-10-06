//
//  ApiManager.swift
//  productApplication
//
//  Created by STC on 06/10/23.
//

import Foundation
import UIKit
//singletone design Pattern


enum DataError: Error{
    case invalidResponce
    case invalidUrl
    case invalidData
    case message(_error : Error?)
    
}


typealias Handler = (Result<productApi,DataError>) -> Void

final class ApiManager{
    static let shared =  ApiManager()
    private init(){}
    
    func fetchingApi(completion : @escaping Handler){
        guard let url = URL(string: Constant.Api.ProductApiUrl)else{
            return
        }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data , error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let responce = responce as? HTTPURLResponse, 200...299 ~=  responce.statusCode else{
                completion(.failure(.invalidResponce))
                return
            }
            do {
                let product  = try JSONDecoder().decode(productApi.self, from: data)
                completion(.success(product))
            }catch{
                completion(.failure(.message(_error: error)))
            }
        }.resume()
    }
}
