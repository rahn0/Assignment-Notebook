//
//  AddAssignmentsView.swift
//  Assignment Notebook
//
//  Created by Ryan Ahn on 7/28/21.
//

// Enables data persistence - Saves information between uses

import Foundation
import SwiftUI

class AssignmentList: ObservableObject {
    @Published var items : [AssignmentItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    // Allows to read in any stored data when app starts up again
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
