//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Gustavo Nunes Lucena on 30/01/19.
//  Copyright © 2019 Gustavo Nunes Lucena. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalAnswer: Int = 0
    var totalCorrectAnswer = 0

    @IBOutlet weak var lbAnswer: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbAnswer.text = "Total de perguntas: \(totalAnswer)"
        lbCorrect.text = "Total de respostas corretas: \(totalCorrectAnswer)"
        lbWrong.text = "Total de respostas incorretas: \(totalAnswer - totalCorrectAnswer)"
        
        let score = totalCorrectAnswer * 100 / totalAnswer
        lbScore.text = "\(score)%"
    }
    

    @IBAction func closeApp(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
