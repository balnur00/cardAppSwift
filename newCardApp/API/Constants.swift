//
//  Constants.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/11/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit

struct App {
    static let baseURL = "http://localhost:8000"
    static let testURL = ""
    
    static let mode = AppMode.prod
    static let log = false
    
    static let iconSize = 24
    static let fontSize: CGFloat = 16
    
    struct Color {
      
      static let blueDark = UIColor(red:0.00, green:0.14, blue:0.26, alpha:1.0) //
      static let blueSky = UIColor(red:0.04, green:0.67, blue:0.85, alpha:1.0) // #09ABDA
      static let lightBlue = UIColor(red:82/255, green:183/255, blue:249/255, alpha:1.0)
      
      static let whiteAlpha = UIColor.white.withAlphaComponent(0.7)
      static let borderColor = UIColor.gray
      
      static let darkGray = UIColor(red: 195/255, green: 198/255, blue: 206/255, alpha: 1)
      static let lightGray = UIColor(red: 230/255, green: 232/255, blue: 233/255, alpha: 1)

      static let hotColor = UIColor(red: 250/255, green: 232/255, blue: 171/255, alpha: 1)
      static let urgentlyLabelColor = UIColor(red: 230/255, green: 130/255, blue: 49/255, alpha: 1)
    }
    
    struct Font {
      static func regular() -> UIFont {
        return regular(size: fontSize)
      }
      
      static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
      }
      
      static func bold() -> UIFont {
        return bold(size: fontSize)
      }
      
      static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
      }
      
      static func semiBold() -> UIFont {
        return semiBold(size: fontSize)
      }
      
      static func semiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Semibold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
      }
      
      static func light() -> UIFont {
        return light(size: fontSize)
      }
      
      static func light(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Light", size: size) ?? UIFont.systemFont(ofSize: size)
      }
      
      static func medium() -> UIFont {
        return medium(size: fontSize)
      }
      
      static func medium(size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Lato-Medium", size: size) {
          return font
        }
        if #available(iOS 8.2, *) {
          return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
        } else {
          return bold(size: size)
        }
      }
      
    }
}

enum AppMode {
    case test
    case prod
}
