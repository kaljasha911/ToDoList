//
//  ToDoItemRow.swift
//  A4JashanKalsi
//
//  Created by Jashan Kalsi on 2025-08-01.
//

import SwiftUI

struct ToDoItemRow: View {
    let toDo: ToDo
    
    var body: some View {
        HStack(spacing: 15) {
            Image("Critical")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
        }
        VStack(alignment: .leading) {
            Text(toDo.title)
                .bold(toDo.isOverdue)
                .font(.headline)
            
            Text("Deadline: \(toDo.deadline, formatter: dateFormatter)")
            
            Text(toDo.description)
                .font(.caption)
            
        }
    }
}

// A simple date formatter for the deadline display
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

#Preview {
    ToDoItemRow(toDo: ToDo.sampleData[0])
}
