//
//  TaskListView.swift
//  ToDoList
//
//  Created by ifpb on 22/12/23.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.name, ascending: true)]) var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks, id: \.self) { task in
                    NavigationLink(destination: TaskDetailsView (task: task)) {
                        Text(task.name ?? "Sem nome")
                    }
                }
            }
            .navigationTitle("Lista de tarefas")
            .navigationBarItems(trailing: NavigationLink(destination: AddTaskView(), label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
