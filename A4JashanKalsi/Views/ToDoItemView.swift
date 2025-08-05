//
//  ToDoItemView.swift
//  A4JashanKalsi
//
//  Created by Jashan Kalsi on 2025-08-04.
//

import SwiftUI

struct ToDoItemView: View {
    let toDo: ToDo
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            priorityIcon()
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            Text(toDo.title)
                .bold(toDo.isOverdue)
                .font(.headline)
            
            Text("Due by \(toDo.deadline, formatter: dateFormatter)")
            
        }
        
        VStack(alignment: .leading) {
            
            HStack {
                Text("Priority:")
                Text(toDo.priority.rawValue)
                    .bold()
                    .padding(5)
                    .background(priorityColor().opacity(0.2))
                    .cornerRadius(5)
            }
            
            Text("Description:")
                .bold()
            
            Text(toDo.description)
            
            Text(timeDifferenceString())
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(toDo.isOverdue ? Color.red.opacity(0.2) : Color.green.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Task Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func timeDifferenceString() -> String {
            let now = Date()
            let components = Calendar.current.dateComponents([.day, .hour], from: min(now, toDo.deadline), to: max(now, toDo.deadline))
            
            let days = components.day ?? 0
            let hours = components.hour ?? 0
            
            if toDo.isOverdue {
                // Format for an overdue task [cite: 40]
                return "Already late by: \(days) days \(hours) hours"
            } else {
                // Format for an upcoming task [cite: 39]
                return "Remaining time: \(days) days \(hours) hours"
            }
    }
    
    private func priorityIcon() -> Image {
        switch toDo.priority {
        case .critical:
            return Image("Critical")
        case .important:
            return Image("Important")
        case .regular:
            return Image("Regular")
        }
    }
    
    // Helper function for priority color
    private func priorityColor() -> Color {
        switch toDo.priority {
        case .critical:
            return .red
        case .important:
            return .orange
        case .regular:
            return .blue
        }
    }
}

// A more detailed date formatter for this view
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()

#Preview {
    ToDoItemView(toDo: ToDo.sampleData[3])
}
