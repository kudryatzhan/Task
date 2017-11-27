//
//  TaskController.swift
//  Task
//
//  Created by Kudryatzhan Arziyev on 11/24/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let shared = TaskController()
    
    // MARK: - Properties
    var tasks = [Task]()
    
    init() {
        tasks = fetchTasks()
    }
    
    // MARK: - Actions
    func add(taskWithName name: String, notes: String?, due: Date?) {
        let _ = Task(name: name, notes: notes, due: due)
        
        saveToPersistenceStore()
        tasks = fetchTasks()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        
        saveToPersistenceStore()
        tasks = fetchTasks()
    }
    
    func remove(task: Task) {
        guard let moc = task.managedObjectContext else { return }
        moc.delete(task)
        
        saveToPersistenceStore()
        tasks = fetchTasks()
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        
        saveToPersistenceStore()
    }
    
    // MARK: - Persistene
    func saveToPersistenceStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            debugPrint("Unable to save data: \(error)")
        }
    }
    
    func fetchTasks() -> [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            return try CoreDataStack.context.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
