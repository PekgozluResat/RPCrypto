//
//  FiatSelectionView.swift
//  RPCrypto
//
//  Created by Resat Pekgozlu on 07/04/2023.
//

import SwiftUI

struct FiatSelectionView: View {
    
    let fiats: [String]
    @State var selectedFiatInt: Int = 0
    @Binding var selectedFiatString: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            ZStack {
                Color.clear
                    .ignoresSafeArea()
                
                HStack(spacing: 10) {
                    ForEach(0..<fiats.count, id: \.self) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(selectedFiatInt == index ? .white.opacity(0.3) : .white.opacity(0.1))
                                .frame(width: 60, height: 30)
                            Text(fiats[index].uppercased())
                                .font(.footnote)
                                .fontWeight(.medium)
                                .frame(maxWidth: 60)
                        }
                        .onTapGesture {
                            withAnimation {
                                selectedFiatInt = index
                                selectedFiatString = fiats[index]
                            }
                        }
                    }
                }
                .padding(.vertical, 0)
                .padding(.horizontal, 10)
            }
            .frame(height: 40)
        }
    }
}

struct FiatSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FiatSelectionView(fiats: dev.fiats, selectedFiatString: .constant(""))
    }
}
