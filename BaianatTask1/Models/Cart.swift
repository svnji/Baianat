//
//  Cart.swift
//  BaianatTask1
//
//  Created by Daddy on 18/08/2024.
//

import Foundation

struct CartResponse: Decodable {
    let carts: [Cart]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Cart: Decodable {
    let id: Int
    let products: [Product]
}

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Double
}
