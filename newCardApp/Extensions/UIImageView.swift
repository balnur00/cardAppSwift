//
//  UIImageView.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/27/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//
import UIKit

extension UIImageView {
    func setImageFromUrl(_ path: String) {
        guard let imageURL = URL(string: path) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
}
