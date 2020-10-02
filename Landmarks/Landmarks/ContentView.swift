//
//  ContentView.swift
//  Landmarks
//
//  Created by Samantha Connelly on 23/12/19.
//  Copyright © 2019 Samantha Connelly. All rights reserved.
//

import SwiftUI
import Combine

struct Bogs: Identifiable {
    let id: UUID
    var rating: String
    var time: Date
}

final class BogStore: ObservableObject {
    @Published var bogs: [Bogs] = [
        .init(id: .init(), rating: "1", time: Date()),
        .init(id: .init(), rating: "2", time: Date()),
        .init(id: .init(), rating: "3", time: Date())
    ]
}

struct BogView : View {
    @ObservedObject var store: BogStore
    var ratings = ["1", "2", "3", "4", "5", "6", "7"]
    @State private var currentRating = 2

    var body: some View {
        VStack {
            Text("Rating")
            Picker("Rating", selection: $currentRating) {
                ForEach(0 ..< ratings.count) {
                    Text(self.ratings[$0])
                }
            }
            .labelsHidden()
            
            Text("Selected: \(ratings[currentRating])")
            HStack {
                Button(action: {self.LogBogs(rating: self.ratings[self.currentRating])}) {
                Text("Log")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                   Text("Skip")
                }.foregroundColor(.orange)
            }
            
            NavigationView {
                List {
                    ForEach(store.bogs.indexed(), id: \.1.id) { index, bog in
                        NavigationLink(destination: EditingView(bog: self.$store.bogs[index])) {
                            VStack(alignment: .leading) {
                                Text(bog.rating)
                                    .font(.headline)
                                Text("Age: \(bog.time)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                //.onAppear(perform: store.fetch)
                .navigationBarTitle(Text("Bogs"))
            }
        }
    }
    
    func LogBogs(rating: String) {
        debugPrint("Logging Bog \(rating)")
    }
}
struct IndexedCollection<Base: RandomAccessCollection>: RandomAccessCollection {
    typealias Index = Base.Index
    typealias Element = (index: Index, element: Base.Element)

    let base: Base

    var startIndex: Index { base.startIndex }

    var endIndex: Index { base.endIndex }

    func index(after i: Index) -> Index {
        base.index(after: i)
    }

    func index(before i: Index) -> Index {
        base.index(before: i)
    }

    func index(_ i: Index, offsetBy distance: Int) -> Index {
        base.index(i, offsetBy: distance)
    }

    subscript(position: Index) -> Element {
        (index: position, element: base[position])
    }
}

extension RandomAccessCollection {
    func indexed() -> IndexedCollection<Self> {
        IndexedCollection(base: self)
    }
}


struct EditingView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var bog: Bogs

    var body: some View {
        Form {
            Section(header: Text("Personal information")) {
                TextField("type something...", text: $bog.rating)
            }

            Section {
                Button("Save") {
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle(Text(bog.rating))
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BogView(store: BogStore.init())
    }
}
