//
//  TarefasViewModel.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 27/03/23.
//

import Foundation

class TarefasViewModel {
    private var tarefas: [String] = []
    
    func adicionarTarefa(_ tarefa: String) {
        tarefas.append(tarefa)
    }
    
    func atualizarTarefa(_ tarefa: String, em index: Int) {
        tarefas[index] = tarefa
    }
    
    func removerTarefaEm(_ index: Int) {
        tarefas.remove(at: index)
    }
    
    func getTarefaEm(_ index: Int) -> String {
        return tarefas[index]
    }
    
    func getNumeroDeTarefas() -> Int {
        return tarefas.count
    }
}
