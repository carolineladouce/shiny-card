//
//  TestShinyView.swift
//  ReflectiveCard
//
//  Created by Caroline LaDouce on 2/2/22.
//

import UIKit

class TestShinyView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    
    let testViewWidth: CGFloat = 350
    let testViewHeight: CGFloat = 350
    let roundedCornerRadius: CGFloat = 10
    
    let innerRectXY: CGFloat = 10
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.clear.cgColor)
        
        context.fill(bounds)
        
        // Draw gray base rounded rect
        let roundedCardRect = CGRect(x: 0, y: 0, width: testViewWidth, height: testViewHeight)
        let roundedCardShapePath = UIBezierPath(roundedRect: roundedCardRect, cornerRadius: roundedCornerRadius)
        UIColor.lightGray.setFill()
        roundedCardShapePath.fill()
        
        // Draw mid white rounded rect
        let midRoundedRect = CGRect(x: 4, y: 4, width: testViewWidth - 8, height: testViewHeight - 8)
        let midRoundedRectPath = UIBezierPath(roundedRect: midRoundedRect, cornerRadius: roundedCornerRadius - 2)
        UIColor.white.setFill()
        midRoundedRectPath.fill()
        
        // Draw gray base circle
        let baseCircle = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: 64, y: 64), size: CGSize(width: testViewWidth - 128, height: testViewHeight - 128) ))
        
        UIColor.gray.setStroke()
        baseCircle.lineWidth = 16
        baseCircle.stroke()
        
        // Draw base gradient rect
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let color1 = UIColor.systemPurple.withAlphaComponent(0.75).cgColor
        guard let color1Components = color1.components else { return }
        let color2 = UIColor.systemTeal.withAlphaComponent(0.75).cgColor
        guard let color2components = color2.components else { return }
        let colorComponents: [CGFloat] = [
            color1Components[0],
            color1Components[1],
            color1Components[2],
            color1Components[3],
            color2components[0],
            color2components[1],
            color2components[2],
            color2components[3]
        ]
        
        let gradientColorLocations: [CGFloat] = [0.0, 1.0]
        let gradientStartPoint = CGPoint(x: 0, y: 0)
        let gradientEndPoint = CGPoint(x: testViewWidth, y: testViewHeight)
        
        guard let colorGradient = CGGradient(colorSpace: colorSpace, colorComponents: colorComponents, locations: gradientColorLocations, count: 2) else { return }
        
        // Clip gradient rectangle to a rounded rectangle shape
        let gradientClipPathRoundedRect = CGRect(x: 0, y: 0, width: testViewWidth, height: testViewHeight)
        let gradientClipPath = UIBezierPath(roundedRect: gradientClipPathRoundedRect, cornerRadius: roundedCornerRadius)
        
        context.saveGState()
        
        gradientClipPath.addClip()
        
        context.drawLinearGradient(colorGradient, start: gradientStartPoint, end: gradientEndPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        
        
        
        
        
        
        
        
        context.restoreGState()
    }
    
}
