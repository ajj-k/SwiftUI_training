//
//  WordListApp.swift
//  WordList
//
//  Created by Kiyoshi Ohashi on 2025/06/28.
//

import SwiftUI

@main
struct WordListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Word.self)
        }
    }
}
