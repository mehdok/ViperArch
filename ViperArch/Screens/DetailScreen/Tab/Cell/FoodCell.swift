//
//  FoodCell.swift
//  ViperArch
//
//  Created by Mehdok on 11/24/20.
//

import UIKit
import DomainLayer

class FoodCell: UITableViewCell {

    var food: MenuItem? {
        didSet {
            updateCell()
        }
    }
    
    private func updateCell() {
        
    }
    
}
