//
//  SettingsView.swift
//  BogLogger
//
//  Created by Samantha Connelly on 17/9/20.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView{
            VStack (alignment: .leading)
            {
                Text("This app collects:")
                Text(" - Time")
                Text(" - Stool Rating")
                Text("")
                Text("And stores it locally")
                Text("")
                Text("Data will be deleted after 28 days")
                Text("")
                Text("Concerns? email info@boglogger.com")

            }
            VStack (alignment: .leading){
                Text ("Read more")
                Text ("https://bughuntersam.com/boglogger/")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
