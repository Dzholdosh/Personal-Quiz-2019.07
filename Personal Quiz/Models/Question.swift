//
//  Question.swift
//  Personal Quiz
//
//  Created by admin on 7/4/19.
//  Copyright © 2019 admin. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponceType
    var answers: [Answear]
    
    static var all: [Question] {
        return [
            Question(text: "Какую еду вы предпочитаете?", type: .single, answers: [
                Answear(text: "Стейк", type: .dog),
                Answear(text: "Рыба", type: .cat),
                Answear(text: "Морковка", type: .rabbit),
                Answear(text: "Капуста", type: .turtle),
                ]),
            Question(text: "Что вам нравится делать?", type: .multiple, answers: [
                Answear(text: "Плавать", type: .turtle),
                Answear(text: "Спать", type: .cat),
                Answear(text: "Обниматься", type: .rabbit),
                Answear(text: "Есть", type: .dog),
                ]),
            Question(text: "Любите ли вы ездить на машине?", type: .ranged, answers: [
                Answear(text: "Ненавижу", type: .cat),
                Answear(text: "Немного нервничаю", type: .rabbit),
                Answear(text: "Почти не замечаю", type: .turtle),
                Answear(text: "Обожаю", type: .dog),
                ])
         ]
    }
    
}
