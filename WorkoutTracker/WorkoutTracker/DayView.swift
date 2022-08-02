//
//  DayView.swift
//  WorkoutTracker
//
//  Created by Paige Holland on 7/10/22.
//

import SwiftUI

struct DayView: View {
    
    @State var userInput = ""
    @State var showAlert = false
    var data: WeekDay
    
    var body: some View {
        VStack { ScrollView{
            VStack {
                Text(data.day)
                    .font(.title)
                HStack {
                    Text("Workout Description: ")
                        .multilineTextAlignment(.leading)
                        .padding(.trailing)
                    TextField("Ran two miles...", text: $userInput)
                } .padding()
                /*
                Picker(selection: .constant(6), label: Text("Exercise")) {
                    Text("Walk").tag(1)
                    Text("Run").tag(2)
                    Text("Tradional Strength Training").tag(3)
                    Text("Yoga").tag(4)
                    Text("Flexibility").tag(5)
                    Text("Other").tag(6)
                }
                */ // Next step for implementing!
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100, style: .continuous).fill(.blue)
                        Button("Add Workout") {
                            if data.desc == "" && !userInput.isEmpty {
                                data.workedOut = true
                                data.color = .green
                                data.desc = "- " + userInput
                            } else if !userInput.isEmpty {
                                data.desc += "\n" + "- " + userInput
                            }
                            userInput = ""
                        } .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 100, style: .continuous).fill(.blue)
                        Button("Clear Workouts") {
                            showAlert = true
                        }.foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .alert("Are you sure you want to clear your workouts for \(data.day)?", isPresented: $showAlert) {
                            Button("Yes") {
                                data.workedOut = false
                                data.color = .black
                                data.desc = ""
                                showAlert = false
                            }
                            Button("Nevermind") { showAlert = false }
                        }
                    }
                }
            } .padding([.leading, .bottom, .trailing])
            VStack(alignment: .leading) {ScrollView {
                Text(data.desc)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 200, minHeight: 60, alignment: .topLeading)
            }} .padding(.all)
        }}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(data: Week.data[0])
    }
}
