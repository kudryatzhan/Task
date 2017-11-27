//
//  TaskController.swift
//  Task
//
//  Created by Kudryatzhan Arziyev on 11/24/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import Foundation

class TaskController {
    
    static let shared = TaskController()
    
    // MARK: - Properties
    var tasks = [Task]()
    
    // Mock data
    var mockTasks: [Task] {
        let firstTask = Task(name: "First Task", notes: nil, due: nil)
        
        let secondTask = Task(name: "Second Task", notes: nil, due: nil)
        secondTask.isComplete = true
        
        let tomorrow = Date(timeIntervalSinceNow: 86400)
        let thirdTask = Task(name: "Third Task", notes: nil, due: tomorrow)
        
        return [firstTask, secondTask, thirdTask]
    }
    
    init() {
        tasks = fetchTasks()
    }
    
    // MARK: - Actions
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    func remove(task: Task) {
        
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
    }
    
    // MARK: - Persistene
    func saveToPersistenceStore() {
        
    }
    
    func fetchTasks() -> [Task] {
        return mockTasks
    }
}
