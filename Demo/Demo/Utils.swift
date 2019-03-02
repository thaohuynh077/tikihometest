//
//  Utils.swift
//  Demo
//
//  Created by admin on 3/2/19.
//

import Foundation
import UIKit

class Utils {
    
    static let colors = ["#16702e", "#005a51", "#996c00", "#5c0a6b", "#006d90", "#974e06", "#99272e", "#89221f", "#00345d"]
    
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let rInt = Int(color >> 16) & mask
        let gInt = Int(color >> 8) & mask
        let bInt = Int(color) & mask
        let red   = CGFloat(rInt) / 255.0
        let green = CGFloat(gInt) / 255.0
        let blue  = CGFloat(bInt) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
