//
//  NewGoalView.swift
//  Mindful
//
//  Created by William Shelley on 7/3/20.
//  Copyright © 2020 William Shelley. All rights reserved.
//

import SwiftUI

struct NewGoalView: View {
    
    let dateDue: Date
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(self.errorMessage).foregroundColor(.red)
            
            TextField("Enter a title ...", text: $title).frame(height: 50, alignment: .center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Enter a description ...", text: $description).frame(height: 50, alignment: .center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Create Goal", action: {
                let goal: Goal = Goal(
                    id: nil,
                    title: self.title,
                    description: self.description,
                    status: BADGE_INCOMPLETE_MESSAGE,
                    dateCreated: Date().str(),
                    dateCompleted: "",
                    dateDue: self.dateDue.str())
                
                if DBM.insert(goal) {
                    self.errorMessage = ""
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    // was unable to insert
                    self.errorMessage = "Cannot have any empty fields"
                }
            })
            
            Spacer()
        }
    }
}