//
//  QuizView.swift
//  NanoChallenge2
//
//  Created by Zevira varies martan on 29/07/22.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var quizViewModel: QuizViewModel
    
    var body: some View {
        ZStack {
            Image("bg")
            .resizable()
            .aspectRatio(contentMode: ContentMode.fill)
            .ignoresSafeArea()
            .navigationBarHidden(true)
            
            LinearGradient(colors: [.purple.opacity(0.4), .blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            if(quizViewModel.model.quizCompleted) {
                QuizCompletedView(quizViewModel: quizViewModel)
            }
            else {
                VStack{
                    ReusableText(text: "Color Palette Quiz", size: 30)
                        .padding()
                    
                    ReusableText(text: quizViewModel.model.quizModel.question, size: 25)
                        .lineLimit(3)
                        .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 10)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        Circle()
                            .trim(from: 0.0, to: min(CGFloat(quizViewModel.progress), 1.0))
                            .stroke(LinearGradient(colors: [.orange, .red],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing),
                                style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: 270))
                            .animation(Animation.linear(duration: Double(quizViewModel.maxProgress)), value: quizViewModel.progress)
                        ReusableText(text: String(quizViewModel.progress), size: 30)
                    }.frame(width: 170, height: 170)
                    Spacer()
                    OptionView(quizViewModel: QuizViewModel())
                }
            }
            
            
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quizViewModel: QuizViewModel())
    }
}


