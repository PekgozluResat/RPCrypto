//
//  CoinRowGlobalView.swift
//  RPCrypto
//
//  Created by Resat Pekgozlu on 01/04/2023.
//

import SwiftUI

struct CoinRowGlobalView: View {
    
    let coin: CoinModel
    @Binding var currency: String
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            rightColumn
        }
        .background(
            Color.white.opacity(0.0001)
                .ignoresSafeArea()
        )
    }
}

struct CoinRowGlobalView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowGlobalView(coin: dev.coin, currency: .constant("usd"))
    }
}

extension CoinRowGlobalView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 40)
//            CoinImageView(coin: coin)
//                .frame(width: 30, height: 30)
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 1) {
                    Text(coin.symbol.uppercased())
                        .font(.headline)
                        .foregroundColor(Color.theme.accent)
                    Text("/\(currency.uppercased())")
                        .font(.caption)
                        .italic()
                        .foregroundColor(Color.theme.accent)
                }
                Text("Vol " + (coin.totalVolume?.formattedWithAbbreviations() ?? ""))
                    .foregroundColor(Color.theme.accent)
                    .font(.caption)
                    .italic()
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity,maxHeight: 40, alignment: .leading)
        }
    }
    
    private var rightColumn: some View {
        HStack(spacing: 20) {
            VStack(alignment: .trailing, spacing: 2) {
                Text(coin.currentPrice.asCurrencyWith6Decimals(currency: currency))
                    .font(.headline)
                    .minimumScaleFactor(0.01)
                Text(coin.currentPrice.asCurrencyWith6Decimals(currency: currency))
                    .font(.caption)
                    .italic()
                    .minimumScaleFactor(0.01)
            }
            .foregroundColor(Color.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPresentString() ?? "")
                .shadow(color: .black.opacity(0.8), radius: 8, x: 0.5, y: 0.5)
                .bold()
                .foregroundColor(Color.white)
                .frame(width:75, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(                        (coin.priceChangePercentage24H ?? 0) >= 0 ?
                            Color.theme.green :
                            Color.theme.red
                        )
                )
        }
        .frame(width: UIScreen.main.bounds.width / 1.8, alignment: .trailing)
        .frame(maxWidth: .infinity, maxHeight: 40)
    }
}
