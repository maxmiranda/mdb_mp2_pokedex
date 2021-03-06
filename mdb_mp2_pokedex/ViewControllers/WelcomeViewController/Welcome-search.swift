//
//  WelcomeViewController-launchsearch.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/13/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
extension WelcomeViewController {
    
    
    /// Button behavior for the filtered search
    @objc func filterSearch(){
        qualifiedPokemon = searchByActiveFilters()
        performSegue(withIdentifier: "toSearchResults", sender: self)
    }
    
    
    /// Button behavior for the search bar execution
    func searchBarSearch() {
        qualifiedPokemon = searchByUISearchBar()
        performSegue(withIdentifier: "toSearchResults", sender: self)
    }
    
    
    /// Random Generated Pokemon Search
    @objc func randomSearch() {
        var random_options_selected = Set<Int>()
        
        let totalPokemon = UInt32(PokemonGenerator.ALL_POKEMON.count)

        while random_options_selected.count < 20 {
            let random_index = Int(arc4random_uniform(totalPokemon))
            random_options_selected.insert(random_index)
        }
        
        qualifiedPokemon = []
        
        for option in random_options_selected {
            qualifiedPokemon.append(PokemonGenerator.ALL_POKEMON[option])
        }
        performSegue(withIdentifier: "toSearchResults", sender: self)
    }
    
    /// Assigns the searchResultsVC to hold the results of the search
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let searchVC = segue.destination as?  SearchViewController {
            searchVC.pokemonResults = qualifiedPokemon
        }
        
    }
    
    
    /// Searches by the Filters selected
    ///
    /// - Returns: List of pokemon satisfying filters
    func searchByActiveFilters() -> [Pokemon] {
        
        for filter in selected_filters {
            debugPrint(filter.generic_repr())
        }
        
        
        var qualifiedPokemon:[Pokemon] = []
        for poke in PokemonGenerator.ALL_POKEMON {
            var type_satisified = false
            var attr_violated = false
            for filter in selected_filters {
                if filter.filterType == SearchFilter.FILTER_TYPE.INT_GREATER_THAN && !filter.pred(x: poke) {
                    attr_violated = true
                }
                
                if filter.filterType == SearchFilter.FILTER_TYPE.TYPE_EQUALS && filter.pred(x: poke) {
                    type_satisified = true
                }
                
            }
            if type_satisified && !attr_violated {
                qualifiedPokemon.append(poke)
            }
        }
        
        return qualifiedPokemon
    }
    
    
    /// Searches given the query in the SearchBar
    ///
    /// - Returns: List of Pokemon to use
    func searchByUISearchBar() -> [Pokemon] {
        
        for filter in selected_filters {
            debugPrint(filter.generic_repr())
        }
        
        
        var qualifiedPokemon:[Pokemon] = []
        for poke in PokemonGenerator.ALL_POKEMON {
            var satisfied = false
            for filter in selected_filters {
                if filter.filterType == SearchFilter.FILTER_TYPE.NAME_EQUALS && filter.pred(x: poke) {
                    satisfied = true
                    break
                } else if filter.filterType == SearchFilter.FILTER_TYPE.NUM_EQUALS && filter.pred(x: poke) {
                    satisfied = true
                    break
                }
                
            }
            if satisfied {
                qualifiedPokemon.append(poke)
            }
        }
        
        return qualifiedPokemon
    }
}
