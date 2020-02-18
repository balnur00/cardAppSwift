//
//  Toast.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/13/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import Toast_Swift

fileprivate let TOAST_DURATION = 3.0

class Toast: NSObject {
  
  public static func showToast(_ message: String) {
    if let window = UIApplication.shared.delegate?.window as? UIView {
      window.makeToast(message: message)
    }
  }
  
}

extension UIView {
  public func makeToast(message: String) {
    self.makeToast(message, duration: TOAST_DURATION, position: .bottom)
  }
}
