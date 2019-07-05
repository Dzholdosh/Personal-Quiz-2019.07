//
//  AnimalType.swift
//  Personal Quiz
//
//  Created by admin on 7/4/19.
//  Copyright © 2019 admin. All rights reserved.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
}
extension AnimalType {
    var definition: String {
        
        switch self {
            
        case .dog:
            return "Вы любите развлекаться вне дома вместе с людми, которые вам дороги."
            
        case .cat:
            return "Вы гуляете сами по себе. Вам не нужна компания, вы цените свободу."

        case .rabbit:
            return "Вам все мягкое. Вы здоровы и полны энергии."

        case .turtle:
            return "Мудрость важнее скорости. Медленный и вдумчивый всенда выинрывает."
        }
        
    }
}
