//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Gustavo Nunes Lucena on 30/01/19.
//  Copyright © 2019 Gustavo Nunes Lucena. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var lbAnswer: [UIButton]!
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viTimer.frame.size.width = view.frame.size.width //Toda vez que iniciar uma nova tela, o tamanho da barra de tempo volta ao original
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0 //Precisa do self. para identificar o viTimer pois está dentro de uma closure
        }) { (sucess) in
            self.showResult() //Precisa do self para identificar a função pois está dentro de uma closure
        }
        getNewQuiz() //Chamar uma nova tela de quiz
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count { //Alimentar os 4 botões com as respostas
            let option = quizManager.options[i]
            let button = lbAnswer[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResult() {
        performSegue(withIdentifier: "resultSegue", sender: nil) //Chama a tela resultViewController através da segue resultSegue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //Esse método sempre é chamado antes do perform segue, que é onde se deve passar parametros caso precise
          let resultViewController =  segue.destination as! ResultViewController  //É feito um cast pois o .destination é UIViewController, mas o que desejo é que a variável seja do tipo ResultViewController
          resultViewController.totalAnswer = quizManager.totalAnswer
          resultViewController.totalCorrectAnswer = quizManager.totalCorrectAnswers
        
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = lbAnswer.index(of: sender)! //pegar o botão que foi selecionado através do parametro sender, que é o evento do botão
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
    


}
