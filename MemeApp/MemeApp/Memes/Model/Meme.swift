//
//  Meme.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import Foundation

struct APIResult: Decodable {
    var success: Bool
    var data: ResultData
}

struct ResultData: Decodable {
    let memes: [Meme]
}

struct Meme: Decodable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let box_count: Int
}

extension Meme {
    static let dummyData: [Meme] = [
        Meme(id: "444", name: "Juan", url: "https://iamnojoke.com/juan.jpg", width: 350, height: 500, box_count: 2)
    ]
}
