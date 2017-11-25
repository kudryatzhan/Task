//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Kudryatzhan Arziyev on 11/24/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    var task: Task?
    var dueDateValue: Date?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    // MARK: - Actions
    func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text else { return }
        if let task = task {
            TaskController.shared.update(task: task, name: name, notes: notesTextView.text, due: dueDateValue)
        } else{
            TaskController.shared.add(taskWithName: name, notes: notesTextView.text, due: dueDateValue)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // Update views
    func updateViews() {
        if isViewLoaded {
            nameTextField.text = task?.name
            dueDateTextField.text = dueDateValue?.stringValue()
            notesTextView.text = task?.notes
        }
    }
}
