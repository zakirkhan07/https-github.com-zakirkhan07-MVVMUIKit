//
//  ProductListUViewController.swift
//  ProductList
//
//  Created by Zakir Khan on 21/09/2025.
//

import UIKit

class ProductListUViewController: UIViewController {
    @IBOutlet weak var productTableView: UITableView!
    private var viewModel =  ProductViewModel()
    
    override func viewDidLoad(){
     configuation()
    
}

}

extension ProductListUViewController {
    func configuation() {
        productTableView.register(UINib( nibName: "ProductcellTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductcellTableViewCell")
        initViewModel()
        observerViewModel()
    }
    func initViewModel() {
        viewModel.fetchProducts()
    }
    func observerViewModel(){
        viewModel.eventHanler = {[weak self] event in
            guard let self = self else {return}
            switch event {
            case .Loading:break
                print("Loading...")
            case .stopLoading:break
                print("Loading stopped")             
            case .dataLoaded:
                print(self.viewModel.products)
                print("YES+>>>>>>>>>>.")
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print("Error: \(error)")
            }
        }
    }
}

extension ProductListUViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductcellTableViewCell") as?
                ProductcellTableViewCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
}
