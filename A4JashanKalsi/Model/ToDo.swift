//
//  ToDo.swift
//  A4JashanKalsi
//
//  Created by Jashan Kalsi on 2025-08-01.
//

import Foundation

enum Priority: String {
    case critical
    case important
    case regular
}

struct ToDo: Identifiable{
    var id: Int // A unique numeric identifier
    var title: String // A meaningful title of the task
    var priority: Priority // The task's priority
    var deadline: Date // The date and time the task is due
    var description: String // A detailed description of the task
    
    // A computed property to check if the deadline has passed
    var isOverdue: Bool {
        return deadline < Date()
    }
    
    // Static list of hardcoded data for the app
    static var sampleData: [ToDo] = [
        // Create specific dates using DateComponents
        ToDo(id: 0, title: "Buy milk", priority: .critical, deadline: createDate(year: 2025, month: 8, day: 12, hour: 11, minute: 55), description: "Remember to buy milk"),
        ToDo(id: 1, title: "Finish the project", priority: .important, deadline: createDate(year: 2025, month: 8, day: 24, hour: 12, minute: 00), description: "Make sure to finish the project"),
        ToDo(id: 2, title: "Call Bank", priority: .regular, deadline: createDate(year: 2025, month: 8, day: 11, hour: 9, minute: 30), description: "GIC details"),
        ToDo(id: 3, title: "Assignment INFO47546", priority: .critical, deadline: createDate(year: 2025, month: 7, day: 30, hour: 11, minute: 59), description: "Assignment 02 completion"),
        ]
}

// Helper function to create dates easily
// This is a common approach to handle specific date creation.
func createDate(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0) -> Date {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    
    let calendar = Calendar.current
    return calendar.date(from: components) ?? Date()
}
