//
//  ContentView.swift
//  PoxedoxApp
//
//  Created by Yogashivasankarri Senthilkumar on 05/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()

    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPoxemon) { poxemon in
                        NavigationLink(destination: PoxemonDetailView(poxemon: poxemon)
                        ) {
                            PoxemonView(poxemon: poxemon)
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPoxemon.count)
                .navigationTitle("PokemonApp")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

