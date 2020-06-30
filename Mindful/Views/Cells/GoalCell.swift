//
//  GoalCell.swift
//  Mindful
//
//  Created by William Shelley on 6/30/20.
//  Copyright © 2020 William Shelley. All rights reserved.
//

import SwiftUI

struct GoalCell: View {
    let goal: Goal
    
    var body: some View {
        VStack(alignment: .center) {
            Text(goal.description)
            Text(goal.status)
        }
    }
}

struct GoalCell_Previews: PreviewProvider {
    static var previews: some View {
        GoalCell(goal: Goal(id: nil, userId: nil, description: "Description", status: "COMPLETE", createdDayId: nil, completedDayId: nil, deadlineDayId: nil))
    }
}
