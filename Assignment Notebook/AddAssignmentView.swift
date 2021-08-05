//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Ryan Ahn on 7/28/21.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    // Course List
    static let courses = ["Math", "Science", "English", "History", "Computer Sciece", "Arts", "PE"]
    var body: some View {
        NavigationView {
            Form {
                // Course picker
                Picker("Courses", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                    }
                }
                // Sets description for  assignment
                TextField("Description", text: $description)
                // Sets data for  assignment
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            // Save button stores information and sends user back to the original list view
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course, description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
