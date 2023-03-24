//
//  PokemonManager.swift
//  pokk
//
//  Created by Onur Sir on 22.03.2023.
//

import Foundation

class PokemonManager {
    
    let networkService = NetworkService()
    var pokemonList: [Pokemon] = []

    func getPokemon(completion: @escaping ([Pokemon]) -> (), failure: @escaping (Error) -> ()) {
           networkService.fetchData(url: "https://pokeapi.co/api/v2/pokemon?limit=40&offset=0", model: PokemonPage.self, completion: { data in
               self.pokemonList = data.results
               completion(data.results)
           }, failure: failure)
       }
    
    func getDetailedPokemon(id: Int, completion: @escaping (DetailPokemon) -> (), failure: @escaping (Error) -> ()) {
        networkService.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)", model: DetailPokemon.self, completion: completion, failure: failure)
    }
    
}
