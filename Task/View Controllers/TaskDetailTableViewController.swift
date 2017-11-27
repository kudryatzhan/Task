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
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    var dueDateValue: Date?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    // MARK: - Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueDateTextField.inputView = dueDatePicker
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
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = sender.date
        dueDateTextField.text = sender.date.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
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
