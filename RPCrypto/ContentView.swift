//
//  ContentView.swift
//  RPCrypto
//
//  Created by Resat Pekgozlu on 16/03/2023.
//

import SwiftUI
import UIKit

class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
    }
    
    func setAlternateButton(_ buttons:Array<RadioButton>) {
        alternateButton = buttons
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.layer.borderColor = UIColor.gray.cgColor
        } else {
            for button:RadioButton in alternateButton! {
                button.isSelected = false
                button.layer.borderColor = UIColor.gray.cgColor
            }
            sender.isSelected = true
            sender.layer.borderColor = UIColor.blue.cgColor
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("AccentColor")
                    .foregroundColor(Color.theme.accent)
                Text("Secontary Text")
                    .foregroundColor(Color.theme.secondaryText)
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
            }
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
