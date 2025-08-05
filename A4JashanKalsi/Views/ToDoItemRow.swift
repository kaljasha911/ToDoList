//
//  ToDoItemRow.swift
//  A4JashanKalsi
//
//  Created by Jashan Kalsi on 2025-08-01.
//

import SwiftUI

struct ToDoItemRow: View {
    let toDo: ToDo
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing: 15) {
            priorityIcon()
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
        }
        VStack(alignment: .leading) {
            Text(toDo.title)
                .bold(toDo.isOverdue)
                .font(.headline)
                
            Text("Deadline: \(toDo.deadline, formatter: dateFormatter)")
                .bold(toDo.isOverdue)
                
            //Text(toDo.description)
            //   .font(.caption)
                
        }
            // Apply red color to the entire row if overdue
            .foregroundColor(toDo.isOverdue ? overdueColor : priorityColor())
            .font(.subheadline)
    }
        
    // Helper function to determine the icon based on priority
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
    
    private func priorityColor() -> Color {
        switch toDo.priority {
        case .critical:
            return .red
        case .important:
            return .orange
        case .regular:
            return .yellow
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
    ToDoItemRow(toDo: ToDo.sampleData[2])
        .preferredColorScheme(.dark)
}
