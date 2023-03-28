//
//  AgendaVC.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 28/03/23.
//

import UIKit

class AgendaVC: UIViewController {
    
    var agendaScreen: AgendaScreen?
    
    override func loadView() {
        self.agendaScreen = AgendaScreen()
        self.view = self.agendaScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}
