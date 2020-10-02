//
//  ContentView.swift
//  BogLogger WatchKit Extension
//
//  Created by Samantha Connelly on 21/8/19.
//  Copyright © 2019 Samantha Connelly. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("1🧱")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("2💰")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("3🐛")
                }
            }
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("4🍌")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("5🍦")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("6🥣")
                }
            }
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("7🌊")
                }
                Spacer()
            }
        }.navigationBarTitle(Text("Rating"))
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
