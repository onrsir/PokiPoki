//
//  DetailViewModel.swift
//  PokedexApp
//
//  Created by Onur Sir on 10.07.2022.
//

import Foundation

class DetailViewModel {
    var str: String = ""
    var chosenPokemon: DetailPokemon?
    var pokeId: Int?
    
    private let pokemonManager = PokemonManager()
    var onComplete: (() -> Void)?
    
    func setChosenPokemon() {
        guard let pokeId = pokeId else {
            return
        }
        pokemonManager.getDetailedPokemon(id: pokeId, completion: { [weak self] pokemon in
            self?.chosenPokemon = pokemon
            self?.onComplete?()
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
    
    func convertStringFromOptInt(value: Int?) -> String {
        guard let value = value else {
            return ""
        }
        return String(value)
    }
    
    func convertStringFromOptFloat(value: Float?) -> String {
        guard let value = value else {
            return ""
        }
        return String(value)
    }
    
    func formatFloat(value: Int) -> Float {
        return (Float(value) * 1.0) / 120
    }
    
    func formatHeightWeight(value: Int) -> String {
        let formattedValue = Double(value) / 10
        return String(format: "%.1f", formattedValue)
    }
    
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonManager.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }

    
    func getDetailsWithId(id: Int, completion: @escaping (DetailPokemon) -> (), failure: @escaping (Error) -> ()) {
        pokemonManager.getDetailedPokemon(id: id, completion: completion, failure: failure)
    }
    
    func setImage() -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokeId!).png"
    }
}
