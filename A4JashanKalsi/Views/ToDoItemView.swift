//
//  ToDoItemView.swift
//  A4JashanKalsi
//
//  Created by Jashan Kalsi on 2025-08-04.
//

import SwiftUI

struct ToDoItemView: View {
    let toDo: ToDo
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            priorityIcon()
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            Text(toDo.title)
                .bold(toDo.isOverdue)
                .foregroundColor(toDo.isOverdue ? overdueColor : .primary)
            Text("Due by \(toDo.deadline, formatter: dateFormatter)")
                .bold(toDo.isOverdue)
                .foregroundColor(toDo.isOverdue ? overdueColor : .primary)
            
        }
        
        VStack(alignment: .leading) {
            
            HStack {
                Text("Priority:")
                Text(toDo.priority.rawValue)
                    .bold()
                    .padding(5)
                    .background(priorityColor().opacity(0.3))
                    .cornerRadius(5)
            }
            
            Text("Description:")
                .bold()
            
            Text(toDo.description)
            
            Text(timeDifferenceString())
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(toDo.isOverdue ? overdueColor.opacity(0.3) : upcomingColor.opacity(0.3))
                .bold()
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
            }
            else {
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
    
    var overdueColor: Color {
        colorScheme == .dark ? Color(red: 1.0, green: 0.5, blue: 0.5) : .red
    }
    var upcomingColor: Color {
        colorScheme == .dark ? Color(red: 0.5, green: 1.0, blue: 0.5) : .green
    }
    var criticalColor: Color {
        colorScheme == .dark ? Color(red: 1.0, green: 0.5, blue: 0.5) : .red
    }
    var importantColor: Color {
        colorScheme == .dark ? Color(red: 1.0, green: 0.7, blue: 0.5) : .orange
    }
    var regularColor: Color {
        colorScheme == .dark ? Color(red: 0.5, green: 0.7, blue: 1.0) : .blue
    }
    
    // Helper function for priority color
    private func priorityColor() -> Color {
        switch toDo.priority {
        case .critical: return criticalColor
        case .important: return importantColor
        case .regular: return regularColor
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
        .preferredColorScheme(.dark)
}
