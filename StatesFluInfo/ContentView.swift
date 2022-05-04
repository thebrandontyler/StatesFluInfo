//
//  ContentView.swift
//  StatesFluInfo
//
//  Created by Alivia Fairchild on 5/3/22.
//

import SwiftUI


struct ContentView: View {
    @State var searchText = ""
    @StateObject var dataTaskManager = DataTaskManager()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(dataTaskManager.dataToView, id: \.self) {state in
                    if validateResponse(var1: state.dimension, var2: state.year_season) {
                        HStack{
                            Text(state.geography)
                            Text(state.year_season)
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Look for a state")
            .navigationTitle("States Statistics")
        }
        .onSubmit (of: .search)
        {
            dataTaskManager.fetch()
            dataTaskManager.searchFetch(searchTerm: searchText)
        }
    }
    
    func validateResponse(var1: String, var2: String) -> Bool {
        if var1 == "25-34 Years" && var2 == "2017" {
            return true
        } else {
            return false
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
