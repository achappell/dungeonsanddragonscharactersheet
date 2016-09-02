//
//  ScoreLabel.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit

class ScoreLabel: UILabel {

    override func awakeFromNib() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
}
