//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Kudryatzhan Arziyev on 11/26/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    
    var delegate: ButtonTableViewCellDelegate?
    var task: Task?


    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    // Update image of the button
    func updateButton(_ isComplete: Bool) {
        if isComplete {
            completeButton.setImage(UIImage(named: "complete"), for: .normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
        task?.isComplete = isComplete
    }
}

extension ButtonTableViewCell {
    
    func update(withTask task: Task) {
        self.task = task
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
