//
//  QuestionViewController.swift
//  Personal Quiz
//
//  Created by admin on 7/4/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStckView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet var progressView: UIProgressView!
    
    //MARK: - Properties
    var answersChosen = [Answear]()
    var questionIndex = 0
    var questions: [Question]!
    
    var currentQuestion: Question {
        return questions[questionIndex]
    }
    
    var currentAnswers: [Answear] {
        return currentQuestion.answers
    }
    
    //MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Question.all
        updateUI()

    }
    //MARK: - Custom Methods
    func updateUI() {
        singleStckView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        let progress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(progress, animated: true)
        
        switch currentQuestion.type {
            
        case .single:
            updateSingleStack(with: currentAnswers)
            
        case .multiple:
            updateMultipleStack(with: currentAnswers)
            
        case .ranged:
            updateRangedStack(with: currentAnswers)
        }
        
    }
    
    func updateSingleStack(with answears: [Answear]) {
        singleStckView.isHidden = false
        for (button, answer) in zip(singleButtons, answears) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    func updateMultipleStack(with answears: [Answear]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multiLabels, answears) {
            label.text = answer.text
        }
    }
    
    func updateRangedStack(with answears: [Answear]) {
        rangedLabels.first?.text = answears.first?.text
        rangedLabels.last?.text = answears.last?.text
        rangeStackView.isHidden = false
    }
    
    func nextQuestion() {
        questionIndex += 1

        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    //MARK: - Navigations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ResultsSegue" else { return }
        let destination = segue.destination as! ResultsViewController
        destination.responses = answersChosen
    }
    
    //MARK: - Actions
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let answerIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[answerIndex]
        answersChosen.append(answer)
        
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        for (index, view) in multipleStackView.arrangedSubviews.enumerated() {
            guard let stackView = view as? UIStackView else { continue }
            guard let switchView = stackView.arrangedSubviews.last as? UISwitch else { continue }
            if switchView.isOn {
                let answer = currentAnswers[index]
                answersChosen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed(_ sender: UIButton) {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        let answer = currentAnswers[index]
        answersChosen.append(answer)
        
        nextQuestion()
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        let numberOfSteps = Float(currentAnswers.count - 1)
        let step = 1 / numberOfSteps
        let index = round(rangedSlider.value * numberOfSteps)
        sender.value = step * index
    }
    
}
