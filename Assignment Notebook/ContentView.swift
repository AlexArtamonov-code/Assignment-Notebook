//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Alex Artamonov on 2/25/26.
//

import SwiftUI
struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course: String
    var description: String
    var dueDate: Date
}
struct ContentView: View {
    @State private var assignmentItems = [
        AssignmentItem(course: "Algebra", description: "Linear Equation", dueDate: Date()),
        AssignmentItem(course: "History", description: "Civil War Paper", dueDate: Date()),
        AssignmentItem(course: "Science", description: "Atomic Bomb Lab", dueDate: Date())
    ]
    @State private var assignmentList = AssignmentList()
    @State private var showingAddView = false
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(assignmentItems) { item in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.course)
                                .font(.headline)
                                .foregroundColor(.blue)
                            
                            Text(item.description)
                                .font(.body)
                            
                            Text("Due: \(item.dueDate.formatted(date: .abbreviated, time: .omitted))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(5)                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
                .navigationTitle("Assignment Notebook")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddView = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddView) {
                    AddAssignmentView(assignmentList: assignmentList)
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
