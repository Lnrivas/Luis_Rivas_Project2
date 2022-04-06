//
//  AddNewAvenger.swift
//  ListNavDemo
//
//  Created by Luis Rivas on 4/5/22.
//

import SwiftUI

struct AddNewAvenger: View {
    @StateObject var avengerStore : AvengerStore
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Avenger Details")) {
                DataInput(title: "Avenger Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
            }
            Button(action: addNewAvenger) {
                Text("Add Avenger")
            }
        }
    }
    
    func addNewAvenger() {
        let newAvenger = Avenger(id: UUID().uuidString,
                         name: name, description: description)
        avengerStore.avengers.append(newAvenger)
    }
    
    struct AddNewAvenger_Previews: PreviewProvider {
        static var previews: some View {
            AddNewAvenger(avengerStore: AvengerStore(avengers: avengerData))
        }
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
