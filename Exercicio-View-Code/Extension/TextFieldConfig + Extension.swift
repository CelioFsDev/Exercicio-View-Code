//
//  TextFieldConfig + Extension.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 23/03/23.
//

import Foundation
import UIKit

extension UITextField {
    convenience init(
        placeholder: String,
        textColor: UIColor,
        font: UIFont,
        backgroundColor: UIColor,
        textAlignment: NSTextAlignment = .center,
        cornerRadius: CGFloat = 0,
        clipsToBounds: Bool = true,
        isEnabled: Bool = true,
        isUserInteractionEnabled: Bool = true,
        keyboardType: UIKeyboardType
    ) {
        self.init()
        self.placeholder = placeholder
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.clipsToBounds = clipsToBounds
        self.layer.cornerRadius = cornerRadius
        self.isEnabled = isEnabled
        self.isUserInteractionEnabled = isUserInteractionEnabled
        self.keyboardType = keyboardType
    }
}


