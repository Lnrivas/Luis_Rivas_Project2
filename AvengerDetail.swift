//
//  AvengerDetail.swift
//  Luis_Rivas_Project2
//
//  Created by Luis Rivas on 4/5/22.
//

import SwiftUI

struct AvengerDetail: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "blue"]
    @State private var colorIndex = 0
    let selectedAvenger: Avenger
    var body: some View {
        Form {
            Section(header: Text("Avenger Details")) {
                Text(selectedAvenger.name)
                    .font(.headline)
                    .foregroundColor(colors[colorIndex])
                Text(selectedAvenger.description)
                    .font(.body)
                Button(action: changeColor) {
                    Text("Randomize Color")
                }
            }
        }
    }
    func changeColor() {
        self.colorIndex = Int.random(in: 0..<colors.count)
    }
}

struct AvengerDetail_Previews: PreviewProvider {
    static var previews: some View {
        AvengerDetail(selectedAvenger: avengerData[0])
    }
}
