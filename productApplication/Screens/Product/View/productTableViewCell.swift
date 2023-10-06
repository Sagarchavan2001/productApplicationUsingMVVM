//
//  productTableViewCell.swift
//  productApplication
//
//  Created by STC on 06/10/23.
//

import UIKit

class productTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var RatingButton: UIButton!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    var Product12 : Products?{
        didSet{
          productDetailsConfigration()
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
    func productDetailsConfigration(){
        guard let Product12 else{return}
        titleLabel.text = Product12.title
        descriptionLabel.text = Product12.description
        RatingButton.setTitle("\(Product12.rating)", for: .normal)
        brandLabel.text = Product12.brand
        categoryLabel.text = Product12.category
        priceLabel.text = "$ \(Product12.price)"
        for images in Product12.images{
            productImageView.setimage(with: images)
        }
    }
    
}
