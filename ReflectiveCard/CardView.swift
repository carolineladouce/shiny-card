//
//  CardView.swift
//  ReflectiveCard
//
//  Created by Caroline LaDouce on 1/26/22.
//

import UIKit

class CardView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    let cardSizeWidth: CGFloat = 337
    let cardSizeHeight: CGFloat = 212.5
    let innerRectXY: CGFloat = 2
    let roundedRectCornerRadius: CGFloat = 10
    
    let cardEdgeLineWidth: CGFloat = 4
    let grayColor: UIColor = UIColor.systemGray
    
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.clear.cgColor)
        
        context.fill(bounds)
        
        // Draw gray base rounded rectangle
        let roundedCardRect = CGRect(x: 0, y: 0, width: cardSizeWidth, height: cardSizeHeight)
        let roundedCardShapePath = UIBezierPath(roundedRect: roundedCardRect, cornerRadius: roundedRectCornerRadius)
        
        UIColor.lightGray.setFill()
        roundedCardShapePath.lineWidth = cardEdgeLineWidth
        
        roundedCardShapePath.fill()
        
        // Draw white rounded rectangle
        let innerRect = CGRect(x: innerRectXY, y: innerRectXY, width: cardSizeWidth - (innerRectXY * 2), height: cardSizeHeight - (innerRectXY * 2))
        let innerRectPath = UIBezierPath(roundedRect: innerRect, cornerRadius: roundedRectCornerRadius - innerRectXY)
        
        UIColor.white.setFill()
        innerRectPath.fill()
        
        
        // Draw gradient rectangle
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
        let gradientEndPoint = CGPoint(x: cardSizeHeight, y: cardSizeWidth)
        
        guard let colorGradient = CGGradient(colorSpace: colorSpace, colorComponents: colorComponents, locations: gradientColorLocations, count: 2) else { return }
        
        // Clip gradient rectangle to a rounded rectangle shape
        let gradientClipPathRoundedRect = CGRect(x: 0, y: 0, width: cardSizeWidth, height: cardSizeHeight)
        let gradientClipPath = UIBezierPath(roundedRect: gradientClipPathRoundedRect, cornerRadius: roundedRectCornerRadius)
        
        context.saveGState()
        
        gradientClipPath.addClip()
        
        context.drawLinearGradient(colorGradient, start: gradientStartPoint, end: gradientEndPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        
        context.saveGState()
        
        
        let baseCircle1 = UIBezierPath(ovalIn: CGRect(x: cardSizeWidth - (cardSizeWidth / 3.5), y: cardSizeHeight - (cardSizeHeight / 2.5), width: cardSizeHeight / 4.5, height: cardSizeHeight / 4.5))
        UIColor.darkGray.setStroke()
        baseCircle1.lineWidth = 3
        baseCircle1.stroke()
        
        let baseCircle2 = UIBezierPath(ovalIn: CGRect(x: cardSizeWidth - (cardSizeWidth / 4.75), y: cardSizeHeight - (cardSizeHeight / 2.5), width: cardSizeHeight / 4.5, height: cardSizeHeight / 4.5))
        UIColor.darkGray.setStroke()
        baseCircle2.lineWidth = 3
        baseCircle2.stroke()
        
        
        let circleOverlay1 = UIBezierPath(ovalIn: CGRect(x: cardSizeWidth - (cardSizeWidth / 3.5), y: cardSizeHeight - (cardSizeHeight / 2.5), width: cardSizeHeight / 4.5, height: cardSizeHeight / 4.5))
        UIColor.white.setStroke()
        circleOverlay1.lineWidth = 1
        circleOverlay1.stroke()
        
        
        let circleOverlay2 = UIBezierPath(ovalIn: CGRect(x: cardSizeWidth - (cardSizeWidth / 4.75), y: cardSizeHeight - (cardSizeHeight / 2.5), width: cardSizeHeight / 4.5, height: cardSizeHeight / 4.5))
        UIColor.white.setStroke()
        circleOverlay2.lineWidth = 1
        circleOverlay2.stroke()

        context.restoreGState()
    }
    
    
    
}
