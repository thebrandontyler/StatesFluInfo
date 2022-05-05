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
    
    // Since you already have the flu vaccine info when it's initially displayed,
    // you don't have to make another network call to search through that data
    // Here is a way to filter through results in real time (as the user types
    // in the search bar) and the cancel button works now as well :)
    var filteredStates: [FluVaccineInfo] {
        if searchText.isEmpty {
            return dataTaskManager.dataToView
        } else {
            return dataTaskManager.dataToView.filter { $0.geography.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                // Instead of dataTaskManger.dataToView, we can now use filteredStates
                // which handles updating the list based on the search text
                // The model also now has a unique id which can be used here (see the Model file)
                ForEach(filteredStates, id: \.id) { state in
                    if validateResponse(var1: state.dimension, var2: state.year_season) {
                        NavigationLink(destination: StateInfoLink(fluVaccine: state)) {
                            HStack{
                                Text(state.geography)
                                Text(state.year_season)
                            }
                        }
                    }
                }
            }

            .searchable(text: $searchText, prompt: "Look for a state")
//            ForEach(dataTaskManager.searchSuggestions) { suggestion in
//                Text(suggestion.geography)searchCompletion(suggestion.geography)
//            }
            .navigationTitle("States Statistics")
            .refreshable {
                dataTaskManager.dataToView = []
                dataTaskManager.fetch()
            }
        }
//        .onSubmit (of: .search)
//        {
//            dataTaskManager.searchFetch(searchTerm: searchText)
//        }
    }
    
    // No need to have if/else return true/false here (unless this is more confusing!)
    // This one line statement will do the same thing
    func validateResponse(var1: String, var2: String) -> Bool {
        var1 == "25-34 Years" && var2 == "2017"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
