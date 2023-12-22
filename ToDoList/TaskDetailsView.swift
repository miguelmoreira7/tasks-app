//
//  TaskDetailsView.swift
//  ToDoList
//
//  Created by ifpb on 22/12/23.
//

import SwiftUI
import CoreData

struct TaskDetailsView: View {
    let task: Task
    
    var body: some View {
        VStack {
            Text(task.name ?? "Sem nome")
                .font(.title)
                .padding()
            Text("Prioridade: \(task.priority)")
                .padding()
            Text("Até: \(formattedDate(task.dueDate))")
                .padding()
            Text("Completada: \(task.isCompleted ? "Sim": "Não")")
                .padding()
            Spacer()
        }
        .navigationTitle("Detalhes da atividade")
    }
    
    private func formattedDate(_ date: Date?) -> String {
        guard let date = date else {return "Sem data"}
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: date)
    }
}

struct TaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        
        let newTask = Task(context: context)
        newTask.name = "teste"
        newTask.priority = 7
        newTask.dueDate = Date()
        newTask.isCompleted = false
        return TaskDetailsView(task: newTask)
    }
}
