//
//  QuizCompletedView.swift
//  NanoChallenge2
//
//  Created by Zevira varies martan on 29/07/22.
//

import Foundation
import SwiftUI

struct QuizCompletedView: View {
    var quizViewModel: QuizViewModel
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 60))
                .padding()
            
            ReusableText(text: quizViewModel.model.quizWinningStatus ?
                         "Congratulation!" :
                            "Time's up!",
                         size: 30)
                .padding()
            
            ReusableText(text: quizViewModel.model.quizWinningStatus
                         ? "Thank you for playing!!"
                         : "Better luck next time",
                         size: 30)
                .padding()
            
            Button {
                quizViewModel.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Play Again")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.purple.opacity(0.7))
                .cornerRadius(30)
                .padding()
        }
    }
}
