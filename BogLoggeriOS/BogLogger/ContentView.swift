//
//  ContentView.swift
//  BogLogger
//
//  Created by Samantha Connelly on 17/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image("boglogger").resizable().scaledToFit()
            Button(action: {
                print("Button action")
            }) {
                Text("Log")
            }
            Text("")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
