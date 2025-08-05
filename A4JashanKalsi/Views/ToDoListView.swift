//
//  ToDoListView.swift
//  A4JashanKalsi
//
//  Created by Jashan Kalsi on 2025-08-04.
//

import SwiftUI

struct ToDoListView: View {
    // Access the static list of tasks from the ToDo model
    let tasks: [ToDo] = ToDo.sampleData
    
    var body: some View {
        NavigationView {
            List(tasks) { task in
                // Each item in the list is a link to the detail view
                NavigationLink(destination: ToDoItemView(toDo: task)) {
                    ToDoItemRow(toDo: task)
                }
            }
            .navigationTitle("To Do List")
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
