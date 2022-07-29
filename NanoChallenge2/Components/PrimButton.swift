//
//  PrimButton.swift
//  NanoChallenge2
//
//  Created by Zevira varies martan on 29/07/22.
//

import SwiftUI

struct PrimButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    var body: some View {
        Text(text)
            .foregroundColor(.black)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(20)
            .shadow(radius: 10)

    }
}

struct PrimButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimButton(text: "Next")
    }
}
