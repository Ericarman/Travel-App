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
        
        UIColor.orange.setFill()
        path.fill()
        
        UIColor.purple.setStroke()
        path.stroke()
    }
}
