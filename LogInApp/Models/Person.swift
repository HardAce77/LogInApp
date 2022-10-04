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
             person: Person(
                firstName: "Nikita",
                secondName: "Nelubin",
                age: 26,
                company: "ЭР-Телеком",
                department: "Контакт центр",
                jobTitle: "Руководитель группы",
                bio: "Добрый день! Меня зовут Никита. Проживаю в городе Пермь, работаю в компании ЭР-Телеком и мечтаю стать iOS разработчиком. Это уже моя 4-я попытка освоить данный курс, прошлые разы бросал на полпути. Я верю, что в этот раз у меня всё получится, в это верит и моя девушка 😃."
             )
        )
    }
}

struct Person {
    let firstName: String
    let secondName: String
    var age: Int
    var company: String
    var department: String
    var jobTitle: String
    var bio: String
}

