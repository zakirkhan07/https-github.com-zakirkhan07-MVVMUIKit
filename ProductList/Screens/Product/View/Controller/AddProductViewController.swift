//
//  AddProductViewController.swift
//  ProductList
//
//  Created by Zakir Khan on 24/10/2025.
//

import UIKit

struct AddProduct: Codable{
    let title: String
    var id: Int? = nil
}
class AddProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addProduct()
        // Do any additional setup after loading the view.
    }
    

   
//    struct ProductResponse: Decodable {
//        let id: Int
//        let title: String
//    }
    func  addProduct() {
        //first of all we will look for url of post api
        //it will change string into valid url ,if its valid url the execute the rest of code , otherwise it will go in run block
        
        guard let  url = URL(string: "https://dummyjson.com/products/add") else { return }
        let parameter = AddProduct(title: "BMW Car")
        var request = URLRequest(url: url)
       
        request.httpMethod = "POST"
        
        //here we sending the data to sever our data in swift obj and this  type of data server will not understand. server will understand the json format  that why are encoding making it into json
        request.httpBody = try? JSONEncoder().encode(parameter)
        request.allHTTPHeaderFields = APIManager.commanHeadeer
        
        URLSession.shared.dataTask(with: request) { data, repoonse,  error in
            guard let data = data else { return }
            do {
                let productReponse =  try JSONDecoder().decode(AddProduct.self, from: data)
                print(productReponse)
            }
            catch{
                print(error)
            }
        }.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

