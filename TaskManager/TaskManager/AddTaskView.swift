//
//  AddTaskView.swift
//  TaskManager
//
//  Created by Sahil Dadhwal on 7/19/24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var taskName = ""
    @State private var dueDate = Date()
    @State private var priority = "Medium"
    let priorities = ["High","Medium","Low"]
    var addTask: (Task) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Task Name", text: $taskName)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                Picker("Priority", selection: $priority) {
                    ForEach(priorities, id: \.self) {
                        Text($0)
                    }
                }

                .pickerStyle(SegmentedPickerStyle())
                .padding()

            }
            .navigationBarTitle("Add Task")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                let newTask = Task(name: taskName, isCompleted: true, dueDate: dueDate, priority: priority)
                addTask(newTask)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}


struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View{
        Group {
            AddTaskView(addTask: { _ in})
            AddTaskView(addTask: { _ in})
        }
    }
}
