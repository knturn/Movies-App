//
//  UIImageViewExtansion.swift
//  Movies App
//
//  Created by Kaan Turan on 24.08.2022.
//

import Foundation
import UIKit
import Kingfisher
extension UIImageView {
    func setImage(path: String?) {
        guard let path = path,
              let url = URL(imgPath: path) else { return }
        self.kf.setImage(with: url)
    }
}
