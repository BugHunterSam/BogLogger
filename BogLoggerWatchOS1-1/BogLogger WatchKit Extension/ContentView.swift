//
//  ContentView.swift
//  BogLogger WatchKit Extension
//
//  Created by Samantha Connelly on 23/12/19.
//  Copyright © 2019 Samantha Connelly. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var ratings = ["1", "2", "3", "4", "5", "6", "7"]
    var emojis = ["🧱", "💰", "🐛", "🍌", "🍦", "🥣", "🌊"]
    @State var scrollAmount = 0.0
    @State private var currentRating = 2

    var body: some View {
        VStack {
            Picker(selection: $currentRating, label: EmptyView()) {
                ForEach(0 ..< ratings.count) {
                    Text(self.ratings[$0] + " " + self.emojis[$0])
                }
            }
            .focusable(true)
            .digitalCrownRotation($scrollAmount)
            .accentColor(.orange)
            
         //Text("Bog selected: \(ratings[currentRating])")
         
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Log")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                   Text("Skip")
                }.foregroundColor(.orange)
            }
        }.navigationBarTitle(Text("Rating"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
