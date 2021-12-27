//
//  Color.swift
//  Color
//
//  Created by cwcw on 2021/8/2.
//


import SwiftUI

extension Color  {
    
    
    
    static var MainColor = Color.red
    static var SecondaryColor = Color.red
    

    static var back1 = Color("back1")
    static var back2 = Color("back2")
    static var back3 = Color("back3")
    
    static let fc1 = Color("fc1")
    static let fc2 = Color("fc2")
    static let fc3 = Color("fc3")
    
    static let BackGround = Color("BackGround")
    static let Card = Color("Card")
    
    static let Danger = Color("Danger")
    static let Success = Color("Success")
    static let Warning = Color("Warning")
    
    
    
    static var FilmBlue = Color("FilmBlue")
    static var CashBlueLight = Color("CashBlueLight")
    static var CashGreen = Color("CashGreen")
    static var CashGreenLight = Color("CashGreenLight")
    static var CashPink = Color("CashPink")
    static var CashPinkLight = Color("CashPinkLight")
    static var CashRed = Color("CashRed")
    static var FilmYellow = Color("FilmYellow")
    
}


public extension Color {
    
    static var random: Color {
        let red = Double(arc4random()%256)/255.0
        let green = Double(arc4random()%256)/255.0
        let blue = Double(arc4random()%256)/255.0
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    }
    
    var uicolor: UIColor { UIColor(self) }
}

//MARK: Hex颜色扩展
extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
