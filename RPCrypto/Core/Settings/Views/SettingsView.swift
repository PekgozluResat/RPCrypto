//
//  SettingsView.swift
//  RPCrypto
//
//  Created by Resat Pekgozlu on 03/04/2023.
//

import SwiftUI
import PassKit
import UIKit
import Foundation


class SettingsViewModel: ObservableObject {
    
//    func addVirtualKeyCardToWallet() {
//        // Create a new virtual key card
//        var keyCard = PKPass()
//
//
//        // Add the pass to the Wallet
//        let passLibrary = PKPassLibrary()
//        if PKPassLibrary.isPassLibraryAvailable() && !passLibrary.containsPass(keyCard) {
//            do {
//                try passLibrary.addPasses([keyCard])
//                print("Virtual key card added to the Wallet")
//            } catch let error {
//                print("Failed to add virtual key card to the Wallet: \(error.localizedDescription)")
//            }
//        }
//    }
}



struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://www.nicksarno.com")!
    
    @StateObject var vm = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                List {
                    developerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coingeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    swiftfulthinkingSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
                .font(.headline)
                .accentColor(.blue)
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
//                    XMarkButton()
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
//                        vm.addVirtualKeyCardToWallet()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            
    }
}

extension SettingsView {
    
    private var swiftfulthinkingSection: some View {
        Section(header: Text("Swiftful thinking")) {
            
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on Youtube. It uses MVVM Architecture, Combine and CoreData")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on Youtube", destination: youtubeURL)
            Link("Support his coffee addiction", destination: coffeeURL)
        }
    }
    
    private var coingeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingeckoURL)
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            
            VStack(alignment: .leading) {
                Image("RPIcon")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app is developed by Resat Pekgozlu. It uses SwiftUI and is written in 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit personal site", destination: defaultURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn more", destination: defaultURL)
        }
    }
}
