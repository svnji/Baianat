//
//  CartCell.swift
//  BaianatTask1
//
//  Created by Daddy on 18/08/2024.
//

import UIKit

class CartCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var productsTableView: UITableView!
    var products: [Product] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        productsTableView.delegate = self
        productsTableView.dataSource = self
    }

    func configure(with products: [Product]) {
        self.products = products
        productsTableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}
