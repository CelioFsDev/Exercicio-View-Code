//
//  ButtonConfig + Extension.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(title: String, font: UIFont, titleColor: UIColor, target: Any?, action: Selector, isEnable: Bool = true, backgroundColor: UIColor, textAlignment: NSTextAlignment = .center, cornerRadius: CGFloat = 0, clipsToBounds: Bool = true ) {
        self.init()
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        self.addTarget(target, action: action, for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isEnabled = isEnable
        self.backgroundColor = backgroundColor
        self.titleLabel?.textAlignment = textAlignment
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
    }
}
