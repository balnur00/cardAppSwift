//
//  Loadable.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/13/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import PKHUD

protocol Loadable {
    func showLoader()
    func hideLoaderSuccess()
    func hideLoaderFailure()
}

extension Loadable where Self: UIViewController {
    func showLoader() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        UIApplication.shared.beginIgnoringInteractionEvents()
//        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
        HUD.show(.systemActivity, onView: self.view)
    }
    func hideLoaderSuccess() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        UIApplication.shared.endIgnoringInteractionEvents()
        HUD.hide()
    }
    func hideLoaderFailure() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        UIApplication.shared.endIgnoringInteractionEvents()
        HUD.flash(.error, onView: self.view, delay: 1.0, completion: nil)
    }
}
