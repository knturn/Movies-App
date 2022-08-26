//
//  URLExtensions.swift
//  Movies App
//
//  Created by Kaan Turan on 24.08.2022.
//

import Foundation

extension URL {
    init?(imgPath: String) {
        let imgUrl = Constant.imgBaseURL + imgPath
        self.init(string: imgUrl)
    }
}
