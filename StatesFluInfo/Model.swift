//
//  Model.swift
//  StatesFluInfo
//
//  Created by Alivia Fairchild on 5/3/22.
//

import Foundation

struct FluVaccineInfo: Codable, Hashable {
    var geography: String
    var coverage_estimate: String
    var year_season: String
    var dimension: String
}
