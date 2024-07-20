import SwiftUI

struct ContentView: View {
    @State private var tasks = [
        Task(name: "Morning Meditation 🧘‍♀️",
             isCompleted: true,
             dueDate: Date(),
             priority: "Low"
        ),
        Task(name: "Return Amazon Packages 📦",
             isCompleted: true,
             dueDate: Date(),
             priority: "Medium"
        ),
        Task(name: "Buy Groceries 🍎🍌🍞 ",
             isCompleted: true,
             dueDate: Date(),
             priority: "High"
        ),
        Task(name: "Business Meeting 📈",
             isCompleted: true,
             dueDate: Date(),
             priority: "High"
        ),
        Task(name: "Practice projects in Swift ",
             isCompleted: true,
             dueDate: Date(),
             priority: "Medium"
        ),
        Task(name: "Fill car tires with air 🚗",
             isCompleted: true,
             dueDate: Date(),
             priority: "Low"
        ),
        Task(name: "Workout at gym -> rockclimb 🧗‍♂️",
             isCompleted: true,
             dueDate: Date(),
             priority: "Medium"
        ),
    ]
    
    @State private var showAddTaskView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.name)
                        Spacer()
                        if task.isCompleted {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                    .background(colorForPriority(task.priority))
                    .cornerRadius(8)
                }
                .onDelete(perform: deleteTask)
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing: Button(action: {
                showAddTaskView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView { newTask in
                    tasks.append(newTask)
                }
            }
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    private func colorForPriority(_ priority: String) -> Color {
        switch priority {
        case "High":
            return Color.red.opacity(0.2)
        case "Medium":
            return Color.yellow.opacity(0.2)
        case "Low":
            return Color.green.opacity(0.2)
        default:
            return Color.white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
