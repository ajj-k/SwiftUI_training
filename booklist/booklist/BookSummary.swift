//
//  BookSummary.swift
//  booklist
//
//  Created by Kiyoshi Ohashi on 2025/06/29.
//

import SwiftData

@Model
final class BookSummary {
    @Attribute(.unique) var id: String
    var title: String
    var thumbnail: String?
    
    init(id: String, title: String, thumbnail: String? = nil) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
    }
}
