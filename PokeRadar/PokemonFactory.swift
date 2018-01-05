//
//  PokemonFactory.swift
//  PokeRadar
//
//  Created by David Garcia on 1/5/18.
//  Copyright © 2018 David Garcia. All rights reserved.
//

import Foundation

class PokemonFactory {
    
    static let shared: PokemonFactory = {
         let shared = PokemonFactory()
        return shared
    }()
    var pokemons: [Pokemon] = []
   
    init() {
        let data = self.readDataFromCSV(filename: "pokemon", fileType: "csv")
        let csvRows = self.csv(data: data!)
        for row in csvRows {
            if let id = Int(row[0]) {
                if id > 151 { break }
                let name = row[1]
                let pokemon = Pokemon(id: id, name: name)
                self.pokemons.append(pokemon)
            }
        }
    }
    
    func getPokemon(with pokemonId: Int) -> Pokemon {
        return self.pokemons[pokemonId - 1]
    }
    
    func csv(data: String) -> [[String]]{
        var result: [[String]] = []
        
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }
        
        return result
    }
    
    func readDataFromCSV(filename: String, fileType: String) -> String! {
        guard let filepath = Bundle.main.path(forResource: filename, ofType: fileType) else { return nil }
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .utf8)
            return contents
        } catch {
            print("Ha habido un error procesando el fichero \(filename)")
        }
        return nil
    }
    
}
