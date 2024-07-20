//
//  Task.swift
//  TaskManager
//
//  Created by Sahil Dadhwal on 7/19/24.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var isCompleted: Bool
    var dueDate: Date
    var priority: String
}
