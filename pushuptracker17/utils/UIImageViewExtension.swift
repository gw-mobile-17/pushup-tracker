//
//  UIImageViewExtension.swift
//  pushuptracker17
//
//  Created by Jared Alexander on 11/13/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadFrom(urlString: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    return
            }
            DispatchQueue.main.async {
                self.image = image
            }
            }.resume()
    }
}
