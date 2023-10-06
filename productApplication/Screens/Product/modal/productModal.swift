//
//  productModal.swift
//  productApplication
//
//  Created by STC on 06/10/23.
//

import Foundation
struct productApi: Decodable{
    var products: [Products]
}
struct Products: Decodable{
    var id : Int
    var title : String
    var description : String
    var price : Int
    var discountPercentage : Float
    var rating : Float
    var stock : Int
    var brand : String
    var category : String
    var thumbnail : String
    var images : [String]
}
