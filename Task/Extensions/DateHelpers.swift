//
//  DateHelpers.swift
//  Task
//
//  Created by Kudryatzhan Arziyev on 11/25/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
