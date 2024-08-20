//
//  ProductCell.swift
//  BaianatTask1
//
//  Created by Daddy on 18/08/2024.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!

    var isAddedToCart = false

    @IBAction func addButtonTapped(_ sender: UIButton) {
        isAddedToCart.toggle()
        addButton.setTitle(isAddedToCart ? "Remove" : "Add", for: .normal)
        addButton.backgroundColor = isAddedToCart ? .red : .green
    }

    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = "$\(product.price)"
        addButton.setTitle(isAddedToCart ? "Remove" : "Add", for: .normal)
        addButton.backgroundColor = isAddedToCart ? .red : .green
    }
}
