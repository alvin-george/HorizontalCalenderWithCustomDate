//
//  EZLabel.swift
//  EyaalZayeed
//
//  Created by apple on 16/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit


class EZLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        changeFontName()
    }
    
    func changeFontName()
    {
        self.font = UIFont(name: "Arial", size: self.font.pointSize)
    }
}
