//
//  PostersModel.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 24/07/2022.
//

import SwiftUI

// MARK: - POSTERS DATA MODEL

struct Poster: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var info: [String]
}
