//
//  CoinDataService.swift
//  RPCrypto
//
//  Created by Resat Pekgozlu on 17/03/2023.
//

import Foundation
import Combine
import SwiftUI

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []

    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins(currency: "usd")
    }
    
    func getCoins(currency: String) {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=\(currency)&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}
