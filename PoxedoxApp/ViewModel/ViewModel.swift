//
//  ViewModel.swift
//  PoxedoxApp
//
//  Created by Yogashivasankarri Senthilkumar on 05/08/24.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    private let poxemonManager = PoxemonManager()

    @Published var poxemonList = [Poxemon]()
    @Published var poxemonDetails: DetailPoxemon?
    @Published var searchText = ""

    // Used with searchText to filter pokemon results
    var filteredPoxemon: [Poxemon] {
                return searchText == "" ? poxemonList : poxemonList.filter { $0.name.contains(searchText.lowercased()) }
            }

    init() {
        self.poxemonList = poxemonManager.getPoxemon()
    }


    // Get the index of a pokemon ( index + 1 = pokemon id)
    func getPoxemonIndex(poxemon: Poxemon) -> Int {
        if let index = self.poxemonList.firstIndex(of: poxemon) {
            return index + 1
        }
        return 0
    }

    // Get specific details for a pokemon
    func getDetails(poxemon: Poxemon) {
        let id = getPoxemonIndex(poxemon: poxemon)

        self.poxemonDetails = DetailPoxemon(id: 0, height: 0, weight: 0)

        poxemonManager.getDetailedPoxemon(id: id) { data in
            DispatchQueue.main.async {
                self.poxemonDetails = data
            }
        }
    }

    // Formats the Height or the Weight of a given pokemon
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)

        return string
    }
}
