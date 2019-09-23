//
//  TriangleButton.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/22/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

@IBDesignable
class TriangleButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.close()
        
        #colorLiteral(red: 0.4862745098, green: 0.7019607843, blue: 0.2588235294, alpha: 1).setFill()
        path.fill()
        
        #colorLiteral(red: 0.4862745098, green: 0.7019607843, blue: 0.2588235294, alpha: 1).setStroke()
        path.stroke()
        
        contentHorizontalAlignment = .right
        contentVerticalAlignment = .top
    }
}
