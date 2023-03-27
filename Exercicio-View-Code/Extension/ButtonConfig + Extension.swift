//
//  ButtonConfig + Extension.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import Foundation
import UIKit

import UIKit

extension UIButton {
    convenience init(
        title: String,
        font: UIFont,
        titleColor: UIColor,
        target: Any?,
        action: Selector,
        isEnable: Bool = true,
        backgroundColor: UIColor,
        textAlignment: NSTextAlignment = .center,
        cornerRadius: CGFloat = 0,
        clipsToBounds: Bool = true ) {
            
        self.init()
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        self.addTarget(target, action: action, for: .touchUpInside)
        self.addTarget(self, action: #selector(animateButtonPress), for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isEnabled = isEnable
        self.backgroundColor = backgroundColor
        self.titleLabel?.textAlignment = textAlignment
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
    }
    //FUNCAO QUE FAZ O BOTAO DIMINUIR A % QUE ESTA NO SCALEFACTOR
    @objc private func animateButtonPress() {
        let duration: TimeInterval = 0.1
        let scaleFactor: CGFloat = 0.7
        let originalTransform = self.transform
        
        UIView.animate(withDuration: duration, animations: {
            self.transform = self.transform.scaledBy(x: scaleFactor, y: scaleFactor)
        }, completion: { _ in
            UIView.animate(withDuration: duration) {
                self.transform = originalTransform
            }
        })
    }
}

