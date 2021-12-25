//
//  DataManager.swift
//  DailyAdhkaar
//
//  Created by AbuTalha on 23/12/2021.
//

import UIKit

class DataManager {
    static let shared = DataManager()
    
    var duas = [Dua]()
    private init() {
        duas = loadInitialData()
    }
    
    func getAll() -> [Dua] {
        return duas
    }

    func loadInitialData() -> [Dua] {
        let path = Bundle.main.path(forResource: "dua", ofType: "json")
        
        guard let path = path else {
            print ("Unable to find the source dua.json file")
            return []
        }
        
        var duas = [Dua]()
        
        do {
            let data =  try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            duas = try JSONDecoder().decode([Dua].self, from: data)
            print (duas)
            
        } catch {
            print (error.localizedDescription)
        }
        return duas
    }
}


