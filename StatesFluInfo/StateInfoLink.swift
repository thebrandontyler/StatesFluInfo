//
//  StateInfoLink.swift
//  StatesFluInfo
//
//  Created by Alivia Fairchild on 5/4/22.
//

import SwiftUI

struct StateInfoLink: View {
    var fluVaccine: FluVaccineInfo
    var body: some View {
            VStack {
                Text(fluVaccine.coverage_estimate)
                Text(fluVaccine.dimension)
            }
            .navigationTitle(fluVaccine.geography)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

