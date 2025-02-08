//
//  Mockable.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/6/25.
//

import Foundation

protocol Mockable {
    var bundle: Bundle { get }
    
    func loadJSON<R: Decodable>(filename: String, type: R.Type) -> [R]
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self) as! AnyClass)
    }
    
    func loadJSON<R: Decodable>(filename: String, type: R.Type) -> [R]{
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Error loading json file")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode([R].self, from: data)
            return decodedObject
        }catch {
            print(error)
            fatalError("Error Unable to Decode json")
        }
    }
    
    func loadEmptyJSON<R: Decodable>(filename: String, type: R.Type) -> [R]{
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Error loading json file")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode([R].self, from: data)
            return decodedObject
        }catch {
            print(error)
            fatalError("Error Unable to Decode json")
        }
    }
}
