//
//  Squiggle.swift
//  SetGame
//
//  Created by Yuki Muto on 2/21/23.
//

import SwiftUI

struct Squiggle: Shape {
    var geometry: GeometryProxy
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let squiggleHalfHeight = geometry.size.height / 3 / 3
        let squiggleHalfWidth = geometry.size.width / 3 / 3.5
        
        var p = Path()
        p.move(to: CGPoint(x: center.x + squiggleHalfWidth, y: center.y))
        p.addCurve(to: CGPoint(x: center.x, y: center.y - squiggleHalfHeight), control1: CGPoint(x: center.x + squiggleHalfWidth*2, y: center.y - squiggleHalfHeight/6), control2: CGPoint(x: center.x + squiggleHalfWidth, y: center.y - squiggleHalfHeight/5*6))
        p.addCurve(to: CGPoint(x: center.x - squiggleHalfWidth, y: center.y - squiggleHalfHeight/4*3), control1: CGPoint(x: center.x, y: center.y - squiggleHalfHeight), control2: CGPoint(x: center.x - squiggleHalfWidth/3*2, y: center.y - squiggleHalfHeight))
        p.addCurve(to: CGPoint(x: center.x - squiggleHalfWidth, y: center.y), control1: CGPoint(x: center.x - squiggleHalfWidth/3, y: center.y - squiggleHalfHeight/3*2), control2: CGPoint(x: center.x - squiggleHalfWidth / 3, y: center.y - squiggleHalfHeight/6))
        p.addCurve(to: CGPoint(x: center.x, y: center.y + squiggleHalfHeight), control1: CGPoint(x: center.x - squiggleHalfWidth*2, y: center.y + squiggleHalfHeight/6), control2: CGPoint(x: center.x - squiggleHalfWidth, y: center.y + squiggleHalfHeight/5*6))
        p.addCurve(to: CGPoint(x: center.x + squiggleHalfWidth, y: center.y + squiggleHalfHeight/4*3), control1: CGPoint(x: center.x, y: center.y + squiggleHalfHeight), control2: CGPoint(x: center.x + squiggleHalfWidth/3*2, y: center.y + squiggleHalfHeight))
        p.addCurve(to: CGPoint(x: center.x + squiggleHalfWidth, y: center.y), control1: CGPoint(x: center.x + squiggleHalfWidth/3, y: center.y + squiggleHalfHeight/3*2), control2: CGPoint(x: center.x + squiggleHalfWidth / 3, y: center.y + squiggleHalfHeight/6))
        //p.addLine(to: CGPoint(x: center.x - squiggleHalfWidth, y: center.y))
//        p.addCurve(to: CGPoint(x: center.x, y: center.y + squiggleHalfHeight), control1: CGPoint(x: center.x - squiggleHalfWidth*3, y: center.y + squiggleHalfHeight/3), control2: CGPoint(x: center.x - squiggleHalfWidth/2, y: center.y + squiggleHalfHeight/2*4))
        return p
    }
}
