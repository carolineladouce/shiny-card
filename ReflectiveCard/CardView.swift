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
   
        context.restoreGState()
    }
    
    
    
}
