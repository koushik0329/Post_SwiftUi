//
//  Post.swift
//  Post_SiwftUi
//
//  Created by Koushik Reddy Kambham on 10/14/25.
//

import Foundation

struct Person: Decodable, Hashable {
    let id: Int?
    let title: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description = "body"
    }
}

struct PersonList: Decodable {
    var posts: [Person]
}

