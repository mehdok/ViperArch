//
//  FoodCell.swift
//  ViperArch
//
//  Created by Mehdok on 11/24/20.
//

import UIKit
import DomainLayer
import Kingfisher

class FoodCell: UITableViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    
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
