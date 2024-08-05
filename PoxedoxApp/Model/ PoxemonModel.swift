//
//   PoxemonModel.swift
//  PoxedoxApp
//
//  Created by Yogashivasankarri Senthilkumar on 05/08/24.
//

import Foundation


struct PoxemonPage: Codable {
    let count: Int
    let next: String
    let results: [Poxemon]
}

struct Poxemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String

    static var samplePoxemon = Poxemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct DetailPoxemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
