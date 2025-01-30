//
//  ResponseModel.swift
//  ByteCoin
//
//  Created by Tehillah Kangamba on 2025-01-29.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

struct ResponseModel: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}

