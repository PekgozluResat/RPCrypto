//
//  CoinRowView.swift
//  RPCrypto
//
//  Created by Resat Pekgozlu on 17/03/2023.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
        .background(
            Color.white.opacity(0.001)
        )
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .preferredColorScheme(.dark)
            
        }
        .previewLayout(.sizeThatFits)
    }
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 20)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Spacer(minLength: 10)
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 1) {
                    Text(coin.symbol.uppercased())
                        .font(.headline)
                        .foregroundColor(Color.theme.accent)
                    Text(" /USDT")
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
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .font(.headline)
            Text((coin.currentHoldings ?? 0).asNumberString())
                .font(.caption)
                .italic()
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPresentString() ?? "")
                .foregroundColor(                        (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green :
                    Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, height: 40, alignment: .trailing)
    }
}
