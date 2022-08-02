//
//  WeekDay.swift
//  WorkoutTracker
//
//  Created by Paige Holland on 7/10/22.
//

import SwiftUI

class WeekDay: NSObject {
    let id: Int
    let day: String
    var workedOut: Bool
    var icon: String
    var color: Color
    var desc: String
    
    init(id: Int, day: String) {
        self.id = id
        self.day = day
        self.workedOut = false
        self.icon = "circle"
        self.color = .black
        self.desc = ""
    }
}

