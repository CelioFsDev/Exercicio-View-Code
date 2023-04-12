//
//  TarefasViewModel.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 27/03/23.
//

import Foundation

class TarefasViewModel {
    
    struct TarefaItem {
       
        let title: String
    }
    
    private(set) var tarefas:[TarefaItem] = []
    
    func adicionarTarefa(titulo: String){
        let novaTarefa = TarefaItem(title: titulo)
        tarefas.append(novaTarefa)
    }
}
