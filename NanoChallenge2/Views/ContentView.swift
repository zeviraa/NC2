//
//  ContentView.swift
//  NanoChallenge2
//
//  Created by Zevira varies martan on 29/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Image("logo")
                    Text("Color Palette Game")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("AccentColor"))
                    
                    Text("Are you ready to test out your color palette skill?")
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    AllView()
                } label: {
                    PrimButton(text: "Start game!")
                }
                
            }
            .frame(maxWidth: .infinity,  maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.06666667, green: 0.2745098, blue: 0.56078431))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
