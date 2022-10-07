//
//  Person.swift
//  LogInApp
//
//  Created by Nikita Neluybin on 05.10.2022.
//

import Foundation

struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            username: "User",
             password: "Password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let firstName: String
    let secondName: String
    let age: Int
    let photo: String
    let company: String
    let department: String
    let jobTitle: String
    let bio: String
    
    static func getPerson() -> Person {
        Person(
            firstName: "Nikita",
            secondName: "Nelubin",
            age: 26,
            photo: "bio",
            company: "ЭР-Телеком",
            department: "Контакт центр",
            jobTitle: "Руководитель группы",
            bio: """
Добрый день! Меня зовут Никита. Проживаю в городе Пермь. Работаю в компании ЭР-Телеком и мечтаю стать iOS разработчиком.
Это уже моя 4-я попытка освоить данный курс. Прошлые разы бросал на полпути, но на этот раз постараюсь приложить максимум усилий, чтобы пройти курс до конца и осуществить мечту 😃
"""
        )
    }
}

