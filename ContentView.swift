//
//  ContentView.swift
//  Shared
//
//  Created by Luis Rivas on 4/5/22.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var avengerStore : AvengerStore = AvengerStore(avengers: avengerData)
    var body: some View {
        NavigationView {
            List {
                ForEach (avengerStore.avengers) { avenger in
                    ListCell(avenger: avenger)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("List of Avengers"))
            .navigationBarItems(leading: NavigationLink(destination:
                                                            AddNewAvenger(avengerStore: self.avengerStore)) {
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet) {
        avengerStore.avengers.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        avengerStore.avengers.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var avenger: Avenger
    var body: some View {
        NavigationLink(destination: AvengerDetail(selectedAvenger: avenger)) {
            HStack {
                Text(avenger.name)
            }
        }
    }
}



