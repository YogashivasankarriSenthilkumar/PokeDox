//
//  PoxemonDetailView.swift
//  PoxedoxApp
//
//  Created by Yogashivasankarri Senthilkumar on 05/08/24.
//

import SwiftUI

struct PoxemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let poxemon: Poxemon

    var body: some View {
        VStack {
            PoxemonView(poxemon: poxemon)

            VStack(spacing: 10) {
                Text("**ID**: \(vm.poxemonDetails?.id ?? 0)")
                Text("**Weight**: \(vm.formatHW(value: vm.poxemonDetails?.weight ?? 0)) KG")
                Text("**Height**: \(vm.formatHW(value: vm.poxemonDetails?.height ?? 0)) M")

            }
            .padding()
        }
        .onAppear {
            vm.getDetails(poxemon: poxemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PoxemonDetailView(poxemon: Poxemon.samplePoxemon)
            .environmentObject(ViewModel())
    }
}

