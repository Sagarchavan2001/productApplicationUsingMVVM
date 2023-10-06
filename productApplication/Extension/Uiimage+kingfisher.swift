//
//  Uiimage+kingfisher.swift
//  productApplication
//
//  Created by STC on 06/10/23.
//

import Foundation
import Kingfisher
extension UIImageView{
    func setimage(with urlString : String){
        guard let url = URL.init(string: urlString)else{
            return
        }
        let resource = ImageResource(downloadURL: url,cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
