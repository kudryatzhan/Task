//
//  Task+Convenience.swift
//  Task
//
//  Created by Kudryatzhan Arziyev on 11/24/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(name: String, notes: String?, due: Date?, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.due = due
    }
}
