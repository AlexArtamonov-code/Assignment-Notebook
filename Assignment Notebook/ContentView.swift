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
            NavigationView {
                List {
                    ForEach(assignmentItems) { item in
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                            Text(item.dueDate, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
                .navigationTitle("Assignment Notebook")
                .toolbar {
                    EditButton()
                }
            }
        }
        .padding()
    }
    func deleteItem(at offsets: IndexSet) {
        assignmentItems.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        assignmentItems.move(fromOffsets: source, toOffset: destination)
    }

}



#Preview {
    ContentView()
}
