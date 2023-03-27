//
//  HomeViewModel.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import Foundation
import UIKit

class HomeViewModel {
    
     public func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}
