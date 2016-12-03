//
//  CustomView.swift
//  Norma4
//
//  Created by Artem Misesin on 12/2/16.
//  Copyright © 2016 Artem Misesin. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBInspectable
    private var color: UIColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1)
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.borderWidth = 1
            layer.borderColor = color.cgColor
        }
        get {
            layer.borderWidth = 1
            layer.borderColor = color.cgColor
            return layer.cornerRadius
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        path.move(to:CGPoint(x: bounds.minX, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        color.set()
        path.lineWidth = 1
        path.stroke()
        path.fill()
    }

}
