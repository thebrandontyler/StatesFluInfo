//
//  NetworkManager.swift
//  StatesFluInfo
//
//  Created by Alivia Fairchild on 5/3/22.
//

import Foundation
import Combine

class DataTaskManager: ObservableObject {
    @Published var dataToView: [FluVaccineInfo] = []
    var cancellables: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://data.cdc.gov/resource/h7pm-wmjc.json")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [FluVaccineInfo].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { [unowned self] response in
                dataToView = response
                print(response)
            }
            .store(in: &cancellables)
    }
    
    func searchFetch(searchTerm: String) {
        let url = URL(string: "https://data.cdc.gov/resource/h7pm-wmjc.json?geography=\(searchTerm)")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [FluVaccineInfo].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { [unowned self] response in
                dataToView = response
                print(response)
            }
            .store(in: &cancellables)
    }
    
}
