//
//  LabelConfig + Extension.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

