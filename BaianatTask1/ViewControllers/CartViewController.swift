//
//  CartViewController.swift
//  BaianatTask1
//
//  Created by Daddy on 18/08/2024.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var carts: [Cart] = []
    var filteredCarts: [Cart] = []
    var page = 0
    let pageSize = 10
    let apiService = APIManager()
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        let nib = UINib(nibName: "CartCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CardCellIdentifier")
        setupSearchController()
        loadMoreCarts()
    }
    
    // MARK: - Setup Search Controller
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Products"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Data Fetching
    
    func loadMoreCarts() {
        guard !isLoading else { return }
        isLoading = true
        
        apiService.fetchCarts(page: page, pageSize: pageSize) { newCarts in
            self.carts.append(contentsOf: newCarts)
            self.filteredCarts = self.carts
            self.page += 1
            self.isLoading = false
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCarts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCellIdentifier", for: indexPath) as! CartCell
        let cart = filteredCarts[indexPath.row]
        cell.configure(with: cart.products)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(44 + 44 * filteredCarts[indexPath.row].products.count)
    }
    
    // MARK: - UITableViewDataSourcePrefetching
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            loadMoreCarts()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= filteredCarts.count - 1
    }
    
    // MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        filteredCarts = searchText.isEmpty ? carts : carts.filter { cart in
            cart.products.contains { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
}
