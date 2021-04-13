//
//  Post+Author+Story.swift
//  Instagram-iOS
//
//  Created by Mattia Fasoli on 12/04/21.
//

import Foundation
import UIKit

struct Post {
    let description: String
    let image: UIImage
    let author: Author
}

struct Author {
    let nickname: String
    let image: UIImage
}

struct Story {
    let author: Author
    let image: UIImage
}

#if DEBUG

extension Post {
    static func mocks() -> [Post] {
        [
            Post(description: "Amazon Headquarters", image: UIImage(imageLiteralResourceName: "post1"), author: Author(nickname: "Jeff", image: UIImage(imageLiteralResourceName: "author1"))),
            Post(description: "Facebook Headquarters", image: UIImage(imageLiteralResourceName: "post2"), author: Author(nickname: "Mark", image: UIImage(imageLiteralResourceName: "author2"))),
            Post(description: "Microsoft Headquarters", image: UIImage(imageLiteralResourceName: "post3"), author: Author(nickname: "Bill", image: UIImage(imageLiteralResourceName: "author3"))),
            Post(description: "Tesla Headquarters", image: UIImage(imageLiteralResourceName: "post4"), author: Author(nickname: "Elon", image: UIImage(imageLiteralResourceName: "author4")))
        ]
    }
}

extension Story {
    static func mocks() -> [Story] {
        [
            .init(author: Author(nickname: "Jeff", image: UIImage(imageLiteralResourceName: "author1")), image: UIImage(imageLiteralResourceName: "post1")),
            .init(author: Author(nickname: "Mark", image: UIImage(imageLiteralResourceName: "author2")), image: UIImage(imageLiteralResourceName: "post2")),
            .init(author: Author(nickname: "Bill", image: UIImage(imageLiteralResourceName: "author3")), image: UIImage(imageLiteralResourceName: "post3")),
            .init(author: Author(nickname: "Elon", image: UIImage(imageLiteralResourceName: "author4")), image: UIImage(imageLiteralResourceName: "post4"))
        ]
    }
 }

#endif
