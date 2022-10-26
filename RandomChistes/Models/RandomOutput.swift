//
//  RandomOutput.swift
//  RandomChistes
//
//  Created by Brandon Alexis Martinez Cortes on 25/10/22.
//

import Foundation


import Foundation

// MARK: - RandomOutput
struct RandomOutput: Codable,Identifiable {
    let id = UUID()
    let value: String
    let icon_url:String
    let updated_at: String
    let created_at: String
    let url: String
    
    
}
