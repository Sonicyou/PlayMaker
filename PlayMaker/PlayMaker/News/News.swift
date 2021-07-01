//
//  News.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.07.2021.
//

import Foundation

struct NewsResponse: Codable {
    let data: [News]
}

struct News: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let source: String?
    let image: String?
    let category: String?
    let language: String?
    let country: String?
    //let publishedAt: String?
    
//    enum CodingKeys: String, CodingKey {
//        case publishedAt = "published_at"
//        case author, title, description, url, source, image, category, language, country
//    }
}
