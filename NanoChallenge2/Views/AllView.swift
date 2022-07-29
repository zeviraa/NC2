//
//  AllView.swift
//  NanoChallenge2
//
//  Created by Zevira varies martan on 29/07/22.
//

import SwiftUI

struct AllView: View {
    var body: some View {
        QuizView(quizViewModel: QuizViewModel())
    }
}

struct AllView_Previews: PreviewProvider {
    static var previews: some View {
        AllView()
    }
}
