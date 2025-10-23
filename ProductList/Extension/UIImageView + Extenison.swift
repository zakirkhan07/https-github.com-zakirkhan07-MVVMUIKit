//
//  UIImageView + Extenison.swift
//  ProductList
//
//  Created by Zakir Khan on 23/10/2025.
//

import Kingfisher
import UIKit

extension UIImageView {

    func setImage(with urlString: String){
        guard let url =  URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
