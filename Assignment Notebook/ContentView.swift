//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Alex Artamonov on 2/25/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = [
        AssignmentItem(course: "Algebra", description: "Linear Equation", dueDate: Date()),
        AssignmentItem(course: "History", description: "Civil War Paper", dueDate: Date()),
        AssignmentItem(course: "Science", description: "Atomic Bomb Lab", dueDate: Date())
    ]
    struct AssignmentItem: Identifiable {
        var id = UUID()
        var course: String
        var description: String
        var dueDate: Date
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
