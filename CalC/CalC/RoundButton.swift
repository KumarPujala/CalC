//
//  RoundButton.swift
//  CalC
//
//  Created by Kumar Pujala on 22/12/20.
//  Copyright © 2020 Kumar Pujala. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
  
    @IBInspectable var roundButton: Bool = false {
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton{
            layer.cornerRadius = frame.height/2  
        }
    }
}
