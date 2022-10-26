//
//  RandomInput.swift
//  RandomChistes
//
//  Created by Brandon Alexis Martinez Cortes on 25/10/22.
//

import Foundation

// MARK: - RandomInput
struct RandomInput: Codable {
    let iconURL: String
    let id, url, value: String

    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case id, url, value
    }
}
