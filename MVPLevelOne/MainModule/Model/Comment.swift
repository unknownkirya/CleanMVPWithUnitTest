//
//  Person.swift
//  MVPLevelOne
//
//  Created by Кирилл Бережной on 03.04.2023.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
