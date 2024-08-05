//
//  PoxemonManager.swift
//  PoxedoxApp
//
//  Created by Yogashivasankarri Senthilkumar on 05/08/24.
//

import Foundation

class PoxemonManager {
    func getPoxemon() -> [Poxemon] {
        let data: PoxemonPage = Bundle.main.decode(file:"poxemon.json")
        let pokemon: [Poxemon] = data.results

        return pokemon
    }

    func getDetailedPoxemon(id: Int, _ completion:@escaping (DetailPoxemon) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPoxemon.self) { data in
            completion(data)
            print(data)

        } failure: { error in
            print(error)
        }
    }
}


