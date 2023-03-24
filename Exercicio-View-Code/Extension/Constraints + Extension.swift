//
//  Constraints + Extension.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 23/03/23.
//

import Foundation
import UIKit

private func configureConstraints(for view: UIView, top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, trailing: NSLayoutXAxisAnchor, height: CGFloat) {
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        view.topAnchor.constraint(equalTo: top, constant: 20),
        view.leadingAnchor.constraint(equalTo: leading, constant: 10),
        view.trailingAnchor.constraint(equalTo: trailing, constant: -10),
        view.heightAnchor.constraint(equalToConstant: height)
    ])
}
