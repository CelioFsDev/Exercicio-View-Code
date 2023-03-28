//
//  AgendaViewModel.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 28/03/23.
//

import Foundation

class AgendaViewModel {
    struct AgendaItem {
        let date: Date
        let title: String
    }
    
    private(set) var agenda: [AgendaItem] = []
    
    func addAgendaItem(date: Date, title: String) {
        let agendaItem = AgendaItem(date: date, title: title)
        agenda.append(agendaItem)
    }
    
    func filteredAgenda(selectedDate: Date) -> [AgendaItem] {
        return agenda.filter { isSameDay($0.date, selectedDate) }
    }
    
    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func updateAgendaTitle(at index: Int, title: String) {
        agenda[index] = AgendaItem(date: agenda[index].date, title: title)
    }
    
    func removeAgendaItem(at index: Int) {
        agenda.remove(at: index)
    }
}


