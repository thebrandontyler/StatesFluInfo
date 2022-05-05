//
//  Model.swift
//  StatesFluInfo
//
//  Created by Alivia Fairchild on 5/3/22.
//

import Foundation

struct FluVaccineInfo: Codable, Hashable {
    // In order to resolve the console issue that says:
    // "the id occurs multiple times within the collection,
    // this will give undefined results!", you can add a unique
    // identifier for each model object
    var id = UUID()
    
    var geography: String
    var coverage_estimate: String
    var year_season: String
    var dimension: String
    
    // However, this will be required now so Codable knows that the id variable
    // won't be in the json that you download from the network
    // (CodingKeys will tell Codable to only encode/decode these specific variables)
    enum CodingKeys: String, CodingKey {
        case geography, coverage_estimate, year_season, dimension
    }
}
