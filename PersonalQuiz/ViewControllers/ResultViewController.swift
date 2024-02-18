//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Darina Kirilenko on 17.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    
    var results: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animalResult = getMostFrequentAnimal(in: results)
        
        resultLabel.text = "Вы - \(animalResult?.rawValue)"
        getResult()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }

    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func getMostFrequentAnimal(in results: [Answer]) -> Animal? {
        var frequencyDictionary: [Animal: Int] = [:]
        
        for answer in results {
            frequencyDictionary[answer.animal, default: 0] += 1
        }
        
        var mostFrequentAnimal: Animal?
        var maxFrequency = 0
        for (animal, frequency) in frequencyDictionary {
            if frequency > maxFrequency {
                mostFrequentAnimal = animal
                maxFrequency = frequency
            }
        }
        return mostFrequentAnimal
    }
    
    func getResult() {
        let resultAnimal = getMostFrequentAnimal(in: results)
        print(resultAnimal as Any)
        
    }
}
