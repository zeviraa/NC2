//
//  QuizViewModel.swift
//  NanoChallenge2
//
//  Created by Zevira varies martan on 29/07/22.
//

import Foundation
import SwiftUI

class QuizViewModel : ObservableObject {
    static var currIndex = 0
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = QuizViewModel.createGameModel(i: QuizViewModel.currIndex)
    
    var timer = Timer()
    var maxProgress = 15
    @Published var progress = 0
    
    init() {
        self.start()
    }
    
    func verifAnswer(selectedOption: QuizOption) {
        for idx in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[idx].isMatched = false
            model.quizModel.optionsList[idx].isSelected = false
            
        }
        
        if let idx = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId == model.quizModel.answer {
                model.quizModel.optionsList[idx].isMatched = true
                model.quizModel.optionsList[idx].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (QuizViewModel.currIndex < 2) {
                        QuizViewModel.currIndex = QuizViewModel.currIndex + 1
                        self.model = QuizViewModel.createGameModel(i: QuizViewModel.currIndex)
                    }
                    else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
                print("true")
            }
            else {
                model.quizModel.optionsList[idx].isMatched = false
                model.quizModel.optionsList[idx].isSelected = true
                print("wrong")
            }
        }
    }
    
    func restartGame() {
        QuizViewModel.currIndex = 0
        model = QuizViewModel.createGameModel(i: QuizViewModel.currIndex)
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.restartGame()
            }
            else {
                self.progress += 1
            }
            
        } )
    }
    
    func reset() {
        timer.invalidate()
        self.progress = 0
    }
}
extension QuizViewModel
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Which one is the perfect ratio for color palette?",
                      answer: "B",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "50:30:20", color: Color.blue),
                                    QuizOption(id: 12,optionId: "B", option: "60:30:10", color: Color.blue),
                                    QuizOption(id: 13,optionId: "C", option: "30:30:40", color: Color.blue),
                                    QuizOption(id: 14,optionId: "D", option: "20:30:50", color: Color.blue)]),
            
            QuizModel(question: "Which one is the perfect ratio for color palette?",
                      answer: "C",
                      optionsList: [QuizOption(id: 21,optionId: "A", option: "10:10:80", color: Color.blue),
                                    QuizOption(id: 22,optionId: "B", option: "40:20:40", color: Color.blue),
                                    QuizOption(id: 23,optionId: "C", option: "60:30:10", color: Color.blue),
                                    QuizOption(id: 24,optionId: "D", option: "10:20:70", color: Color.blue)]),
            
            QuizModel(question: "Which is the world largest living fish?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "60:30:10", color: Color.blue),
                                    QuizOption(id: 32,optionId: "B", option: "10:10:10", color: Color.blue),
                                    QuizOption(id: 33,optionId: "C", option: "40:20:40", color: Color.blue),
                                    QuizOption(id: 34,optionId: "D", option: "60:35:5", color: Color.blue)])
        ]
    }
}
