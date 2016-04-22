//
//  HeaderButton.swift
//  EduChoice
//
//  Created by Elliot Grafil on 4/1/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import UIKit

class HeaderButton: UIButton {

    private var buttonHeight: CGFloat = 0
    private var buttonWidth: CGFloat = 0
    private var buttonBackgroundLayer: CAShapeLayer = CAShapeLayer()

    
    override var frame: CGRect {
        didSet {
                super.frame = frame
                buttonHeight = frame.height
                buttonWidth = frame.width
        }
    }
    
    var rotation:CGFloat = 0 {
        didSet{
            super.frame = CGRect(x: super.frame.minX, y: super.frame.minY, width: buttonWidth + buttonHeight*tan(rotation), height: buttonHeight)
            
            let rotTrans = CGAffineTransformMakeRotation(-CGFloat(M_PI_2)+rotation)
            

            self.titleLabel?.transform = CGAffineTransformTranslate(rotTrans, (buttonWidth)/2, (buttonWidth)/2)
            
            buttonBackgroundLayer = CAShapeLayer()
            buttonBackgroundLayer.frame = self.layer.bounds
            
            let path = CGPathCreateMutable()
            CGPathMoveToPoint(path, nil, 0, buttonHeight ) //bottom left corner
            CGPathAddLineToPoint(path, nil, buttonWidth , buttonHeight)
            CGPathAddLineToPoint(path, nil, buttonWidth + buttonHeight*tan(rotation), 0)
            CGPathAddLineToPoint(path, nil, buttonHeight*tan(rotation), 0)
        
            buttonBackgroundLayer.path = path
        }
    }

    override func layoutSubviews() {
        if var titleFrame = titleLabel?.frame{
            titleFrame.size = super.bounds.size
            titleFrame.size.height -= 10.0
            titleFrame.origin = CGPointZero
            self.titleLabel!.frame = titleFrame
            self.titleLabel!.bounds = super.bounds
            self.titleLabel!.textAlignment = .Center
 
        }
    }
    
    override func drawRect(rect: CGRect) {
        self.layer.mask = buttonBackgroundLayer
    }
    
    override func pointInside(point: CGPoint, withEvent _: UIEvent?) -> Bool {
        return UIBezierPath(CGPath: buttonBackgroundLayer.path!).containsPoint(point)
        
    }
    
}
