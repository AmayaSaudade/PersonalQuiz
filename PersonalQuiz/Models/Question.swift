//
//  Question.swift
//  PersonalQuiz
//
//  Created by Darina Kirilenko on 17.02.2024.
//

struct Question {
    let title: String
    let answers: [Answer]
    let answerCategory: AnswerCategory
}

struct Answer {
    let title: String
    let animal: Animal
}

enum AnswerCategory {
    case single
    case multiple
    case ranged
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case turtle = "🐢"
    case rabbit = "🐰"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы всегда готовы помочь и окружаете себя людьми, которые вам нравятся."
        case .cat:
            return "Вы сами себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .turtle:
            return "Ваша сила в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        }
    }
}
