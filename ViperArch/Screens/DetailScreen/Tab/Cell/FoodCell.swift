//
//  FoodCell.swift
//  ViperArch
//
//  Created by Mehdok on 11/24/20.
//

import DomainLayer
import Kingfisher
import UIKit

class FoodCell: UITableViewCell {
    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var foodTitle: UILabel!
    @IBOutlet var foodDescription: UILabel!
    
    var food: MenuItem? {
        didSet {
            updateCell()
        }
    }
    
    private func updateCell() {
        foodTitle.text = food?.name
        foodDescription.text = food?.description
        
        if let imagePath = food?.images?.first, let url = URL(string: imagePath) {
            foodImage.kf.setImage(with: url)
        }
    }
}
