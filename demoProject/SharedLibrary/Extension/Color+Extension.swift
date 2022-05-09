//
//  Color+Extension.swift
//  demoProject
//
//  Created by prashant on 09/05/22.
//

import UIKit

public extension UIColor {
    convenience init(hexCode: String, alpha: Float = 1.0) {
        let scanner = Scanner(string: hexCode)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        let mask = 0x0000_00FF
        let r = CGFloat(Float(Int(color >> 16) & mask) / 255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask) / 255.0)
        let b = CGFloat(Float(Int(color) & mask) / 255.0)
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}
