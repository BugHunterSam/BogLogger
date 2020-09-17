//
//  AppView.swift
//  BogLogger
//
//  Created by Samantha Connelly on 17/9/20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Log")
                }
            CalenderView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("View")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Info")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .preferredColorScheme(.dark)
    }
}
