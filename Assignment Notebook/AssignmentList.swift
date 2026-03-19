//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Alex Artamonov on 3/18/26.
//

import Foundation
import Combine

class AssignmentList: ObservableObject {
    @Published var items: [AssignmentItem] = [
        AssignmentItem(course: "Algebra", description: "Linear Equation", dueDate: Date()),
        AssignmentItem(course: "History", description: "Civil War Paper", dueDate: Date()),
        AssignmentItem(course: "Science", description: "Atomic Bomb Lab", dueDate: Date())
    ]
}
