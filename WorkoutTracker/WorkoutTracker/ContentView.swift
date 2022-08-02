//
//  ContentView.swift
//  WorkoutTracker
//
//  Created by Paige Holland on 7/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                List(Week.data, id: \.self) { object in
                    HStack {
                        Image(systemName: object.icon)
                            .foregroundColor(object.color)
                        NavigationLink(object.day, destination: DayView(data: object))
                    }
                } .navigationTitle("Your Weekly Stats")
            }
            HStack {
                Text(Date(), style: .date)
                    .font(.headline)
                    .fontWeight(.heavy)
                    
                Image (systemName: "sun.haze.fill")
                    .foregroundStyle(.blue, .yellow)
                    .padding(.horizontal, 5.0)
                    .frame(width: 7.0)
            }
            HStack {
                Text("Get at it today.").font(.footnote).fontWeight(.regular) .frame( alignment: .center)
            }
            .padding(.bottom)
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
