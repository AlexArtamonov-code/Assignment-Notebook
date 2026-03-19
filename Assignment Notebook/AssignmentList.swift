//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Alex Artamonov on 3/18/26.
//

import Foundation
import Combine

class AssignmentList: ObservableObject {
    
    @Published var items: [AssignmentItem] {
        didSet {
            save()
        }
    }
    
    let saveKey = "AssignmentItems"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([AssignmentItem].self, from: data) {
            items = decoded
        } else {
            items = []
        }
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
