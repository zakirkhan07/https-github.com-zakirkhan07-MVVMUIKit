//
//  ProductcellTableViewCell.swift
//  ProductList
//
//  Created by Zakir Khan on 23/09/2025.
//

import UIKit

class ProductcellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productBackGroundView: UIView!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productLabelTitle: UILabel!
    
    @IBOutlet weak var productCategoryLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var rating: UIButton!
    //did set property its a properpty observer
    var product: Product? {
        didSet {
            productDetailConfiguration()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func productDetailConfiguration() {
        guard let product = product else { return }
        productLabelTitle.text = product.title
        productCategoryLabel.text =  product.category
        descriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
        rating.setTitle("\(product.rating.rate)", for: .normal)
        productImageView.setImage(with: product.image)
    }
    
}
