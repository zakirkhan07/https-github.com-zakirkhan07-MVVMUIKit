//
//  ProductViewModel.swift
//  ProductList
//
//  Created by Zakir Khan on 23/09/2025.
//

import Foundation
 
final class ProductViewModel {
    var products: [Product] = []
    var eventHanler: ((_ event: Event) -> Void)?
    
    func fetchProducts(){
        self.eventHanler?(.Loading)
        APIManager.shared.request(
            modelType: [Product].self,
            type: EndPointsItems.products
        ){
            response in
            self.eventHanler?(.stopLoading)
            switch response {
            case .success(let productData):
                self.products = productData
                self.eventHanler?(.dataLoaded)
            case .failure(let error):
                self.eventHanler?(.error(error))
            }
            }
        
    }
    func addProduct(parameter: AddProduct){
        APIManager.shared.request(
            modelType: AddProduct.self,
            type: EndPointsItems.addProduct(product: parameter)) { result  in
                switch result {
                case .success(let product):
                    self.eventHanler?(.newProductAdded(product: parameter))
                case .failure(let error):
                    self.eventHanler?(.error(error))
                }
            }
    }
//    func fetchProducts(){
//        self.eventHanler?(.Loading)
//        APIManager.shared.fetchProduct{ response in
//            self.eventHanler?(.stopLoading)
//            switch response {
//            case .success(let productData):
//                self.products = productData
//                self.eventHanler?(.dataLoaded)
//            case .failure(let error):
//                self.eventHanler?(.error(error))
//            }
//        }
//    }

}
extension ProductViewModel {
    enum Event {
        case Loading
        case stopLoading
        case dataLoaded
        case error(Error)
        case newProductAdded(product: AddProduct)
        
    }
}
