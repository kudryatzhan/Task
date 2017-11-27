//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Kudryatzhan Arziyev on 11/26/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
    }
    
    // Update image of the button
    func updateButton(_ isComplete: Bool) {
        if isComplete {
            completeButton.setImage(UIImage(named: "complete"), for: .normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}

extension ButtonTableViewCell {
    
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}
