//
//  PoxemonView.swift
//  PoxedoxApp
//
//  Created by Yogashivasankarri Senthilkumar on 05/08/24.
//

import SwiftUI

struct PoxemonView: View {
    @EnvironmentObject var vm: ViewModel
    let poxemon: Poxemon
    let dimensions: Double = 140

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPoxemonIndex(poxemon: poxemon)).png")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensions, height: dimensions)
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
            }
            .background(.thinMaterial)
            .clipShape(Rectangle())

            Text("\(poxemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
}

struct PoxemonView_Previews: PreviewProvider {
    static var previews: some View {
        PoxemonView(poxemon: Poxemon.samplePoxemon)
            .environmentObject(ViewModel())
    }
}
