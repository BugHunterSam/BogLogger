//
//  PrivacyUIView.swift
//  BogLogger
//
//  Created by Samantha Connelly on 29/8/19.
//  Copyright © 2019 Samantha Connelly. All rights reserved.
//

import SwiftUI

struct PrivacyView: View {
    fileprivate func dataCollectedHeading() -> Text {
        return Text("This app collects:")
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack (alignment: .leading) {
                    dataCollectedHeading()
                    Text(" - Stool Rating")
                    Text(" - Device ID")
                    Text(" - Time")
                    Text(" ")
                }
                VStack (alignment: .leading) {
                    Text("And stores it in:")
                    Text(" - Google Cloud")
                    Text(" ")
                }
                VStack {
                    Text("Data will be")
                    Text("deleted after")
                    Text("28 days")
                    Text(" ")
                }
                VStack {
                    Text("Concerns? Email")
                    Text("info@")
                    Text("boglogger.com")
                    Text(" ")
                }
                VStack {
                    Text("This app is").fontWeight(Font.Weight.light)
                    Text("opensource").fontWeight(Font.Weight.light)
                }
                NavigationLink(destination: RatingView()) {
                    Text("Accept")
                }
            }
        }.navigationBarTitle(Text("Privacy"))
    }
}

struct PrivacyUIView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
