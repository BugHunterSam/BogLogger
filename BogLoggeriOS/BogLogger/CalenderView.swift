//
//  OrderView.swift
//  BogLogger
//
//  Created by Samantha Connelly on 17/9/20.
//

import SwiftUI

struct CalenderView: View {
    var body: some View {
        VStack{
            Image("1").resizable().scaledToFit()
            Text("2020-05-17")
            HStack{
                Text("7:22 AM - Type 4 ")
                Image(systemName: "trash")
            }
            HStack{
                Text("3:22 PM - Type 2 ")
                Image(systemName: "trash")
            }
            Text("")
            Text("")
            Button(action: {
                print("Button action")
            }){
                Text("Export")
            }
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
