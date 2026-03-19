//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Alex Artamonov on 3/19/26.
//

import SwiftUI

struct AddAssignmentView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var items: [AssignmentItem]   
    
    static let courses = ["Math", "Science", "History", "English", "Art"]
    
    @State private var course = "Math"
    @State private var description = ""
    @State private var dueDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Description", text: $description)
                
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationTitle("Add New Assignment")
            .toolbar {
                Button("Save") {
                    
                    let newItem = AssignmentItem(
                        course: course,
                        description: description,
                        dueDate: dueDate
                    )
                    
                    
                    items.append(newItem)
                    
                    dismiss()
                }
            }
        }
    }
}
