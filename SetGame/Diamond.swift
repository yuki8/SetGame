//
//  Diamond.swift
//  SetGame
//
//  Created by Yuki Muto on 2/18/23.
//

import SwiftUI

struct Diamond: Shape {
    var geometry: GeometryProxy
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let diamondHalfHeight = geometry.size.height / 3 / 2.5
        let diamondHalfWidth = geometry.size.width / 3
    
        var p = Path()
        p.move(to: CGPoint(x: center.x, y: center.y + diamondHalfHeight))
        p.addLine(to: CGPoint(x: center.x + diamondHalfWidth, y: center.y))
        p.addLine(to: CGPoint(x: center.x, y: center.y - diamondHalfHeight))
        p.addLine(to: CGPoint(x: center.x - diamondHalfWidth, y: center.y))
        p.addLine(to: CGPoint(x: center.x, y: center.y + diamondHalfHeight))
        return p
    }
}
