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
    
    let cardEdgeLineWidth: CGFloat = 4
    let grayColor: UIColor = UIColor.systemGray
    
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.clear.cgColor)
        
        context.fill(bounds)
        
        let cardPathOrigin = CGPoint(x: 0, y: 0)
        let cardPathRightTopPoint = CGPoint(x: 337, y: 0)
        let cardPathRightBottomPoint = CGPoint(x: 337, y: 212.5)
        let cardPathLeftBottomPoint = CGPoint(x: 0, y: 212.5)
        
//        let cardShapePath = UIBezierPath()
//
//        cardShapePath.move(to: CGPoint(x: cardPathOrigin.x, y: cardPathOrigin.y))
//        cardShapePath.addLine(to: CGPoint(x: cardPathRightTopPoint.x, y: cardPathRightTopPoint.y))
//        cardShapePath.addLine(to: CGPoint(x: cardPathRightBottomPoint.x, y: cardPathRightBottomPoint.y))
//        cardShapePath.addLine(to: CGPoint(x: cardPathLeftBottomPoint.x, y: cardPathLeftBottomPoint.y))
//        cardShapePath.close()
//
//        grayColor.setStroke()
//        cardShapePath.lineWidth = cardEdgeLineWidth
        
//        cardShapePath.stroke()
        
        let roundedCardRect = CGRect(x: 0, y: 0, width: 337, height: 212.5)
        let roundedCardShapePath = UIBezierPath(roundedRect: roundedCardRect, cornerRadius: 10)
    
        UIColor.lightGray.setFill()
        roundedCardShapePath.lineWidth = 4
    
        roundedCardShapePath.fill()
        
        let innerRect = CGRect(x: 2, y: 2, width: 333, height: 208.5)
        let innerRectPath = UIBezierPath(roundedRect: innerRect, cornerRadius: 8)
        
        UIColor.white.setFill()
        innerRectPath.fill()
        
        
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
        let gradientEndPoint = CGPoint(x: 337, y: 212.5)
        
        guard let colorGradient = CGGradient(colorSpace: colorSpace, colorComponents: colorComponents, locations: gradientColorLocations, count: 2) else { return }
        
        context.drawLinearGradient(colorGradient, start: gradientStartPoint, end: gradientEndPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
       
        
        context.restoreGState()
    }
    
    
    
}
