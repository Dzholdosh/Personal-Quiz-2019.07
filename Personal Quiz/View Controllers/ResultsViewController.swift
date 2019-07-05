//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by admin on 7/4/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var responses: [Answear]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateUI()
        }
    
    func updateUI() {
        let animalTypes = responses.map { $0.type }
        var animalCount = [AnimalType: Int]()
        animalTypes.forEach { animalType in
            animalCount[animalType] = (animalCount[animalType] ?? 0) + 1
        }
        let sortedCount = animalCount.sorted { $0.value > $1.value }
        let animal = sortedCount.first!.key
        
        answerLabel.text = "Вы - \(animal.rawValue)!"
        definitionLabel.text = animal.definition
        
        print(#line, #function, sortedCount)
    }
}
