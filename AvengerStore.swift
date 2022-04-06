//
//  AvengerStore.swift
//  Luis_Rivas_Project2
//
//  Created by Luis Rivas on 4/5/22.
//

import Foundation
import SwiftUI
import Combine
class AvengerStore : ObservableObject {
    @Published var avengers: [Avenger]
    init (avengers: [Avenger] = []) {
        self.avengers = avengers 
    }
}
