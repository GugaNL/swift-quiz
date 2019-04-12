//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Gustavo Nunes Lucena on 30/01/19.
//  Copyright © 2019 Gustavo Nunes Lucena. All rights reserved.
//

import Foundation


class Quiz  {
    
    var question: String = ""
    var options: [String]
    private var correctedAnswer: String
    
    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    func validadeOptions(_ index: Int) -> Bool {
        let answer = options[index]
        return answer == correctedAnswer
    }
    
    deinit {
        print("Liberou quiz da memória")
    }
    
}
