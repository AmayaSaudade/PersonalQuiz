//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Darina Kirilenko on 17.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var results: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getMostFrequentAnimal()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
    
// MARK: - Private Methods
extension ResultViewController {
    private func getMostFrequentAnimal() {
        var frequencyDictionary: [Animal: Int] = [:]
        let animals = results.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = frequencyDictionary[animal] {
                frequencyDictionary.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyDictionary[animal] = 1
            }
        }
        
        let sortedFrequentOfAnimals = frequencyDictionary.sorted { $0.value > $1.value }
        guard let mostFrequentAnimal = sortedFrequentOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequentAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        resultLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
       
}
    
    

