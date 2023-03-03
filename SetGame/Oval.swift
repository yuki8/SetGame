//
//  Oval.swift
//  SetGame
//
//  Created by Yuki Muto on 2/28/23.
//

import SwiftUI

struct Oval: Shape {
    var geometry: GeometryProxy
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let ovalHalfHeight = geometry.size.height / 3 / 4.5
        let ovalHalfWidth = geometry.size.width / 3 / 2.8
        
        var p = Path()
        p.move(to: CGPoint(x: center.x - ovalHalfWidth, y: center.y - ovalHalfHeight))
        p.addLine(to: CGPoint(x: center.x - ovalHalfWidth, y: center.y + ovalHalfHeight))
        p.addCurve(to: CGPoint(x: center.x + ovalHalfWidth, y: center.y + ovalHalfHeight), control1: CGPoint(x: center.x - ovalHalfWidth/2, y: center.y + ovalHalfHeight*2), control2: CGPoint(x: center.x + ovalHalfWidth/2, y: center.y + ovalHalfHeight*2))
        p.addLine(to: CGPoint(x: center.x + ovalHalfWidth, y: center.y - ovalHalfHeight))
        p.addCurve(to: CGPoint(x: center.x - ovalHalfWidth, y: center.y - ovalHalfHeight), control1: CGPoint(x: center.x + ovalHalfWidth/2, y: center.y - ovalHalfHeight*2), control2: CGPoint(x: center.x - ovalHalfWidth/2, y: center.y - ovalHalfHeight*2))
        return p
    }
}
