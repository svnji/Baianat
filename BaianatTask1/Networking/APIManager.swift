//
//  APIManager.swift
//  BaianatTask1
//
//  Created by Daddy on 18/08/2024.
//

import Foundation

class APIManager {
    func fetchCarts(page: Int, pageSize: Int = 10, completion: @escaping ([Cart]) -> Void) {
        let urlString = "https://dummyjson.com/carts"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }

            do {
                let cartsResponse = try JSONDecoder().decode([Cart].self, from: data)
                completion(cartsResponse)
            } catch {
                print("Failed to decode JSON:", error)
                completion([])
            }
        }.resume()
    }
}

