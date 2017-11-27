//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Kudryatzhan Arziyev on 11/24/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    //MARK: - Lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.shared.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTableViewCell", for: indexPath) as? ButtonTableViewCell else {
            return UITableViewCell()
        }
        let task = TaskController.shared.tasks[indexPath.row]
        
        // Configure the cell...
        cell.update(withTask: task)
        cell.delegate = self
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let taskToDelete = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: taskToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetailVC" {
            if let destinationVC = segue.destination as? TaskDetailTableViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                
                let task = TaskController.shared.tasks[indexPath.row]
                destinationVC.task = task
                destinationVC.dueDateValue = task.due
            }
        }
    }
    
    // ButtonTableViewCellDelegate
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        guard let task = sender.task else { return }
        TaskController.shared.toggleIsCompleteFor(task: task)
        tableView.reloadData()
    }
}
