//
//  MaterialView.swift
//  DevslopeShowcase
//
//  Created by SEBASTIEN MONTIBELLER on 24/03/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 2.0
        self.layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        
        
    }

}
