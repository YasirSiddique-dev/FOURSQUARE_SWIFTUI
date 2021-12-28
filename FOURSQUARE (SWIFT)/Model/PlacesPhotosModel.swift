//
//  PlacesPhotosModel.swift
//  FourSquare (SwiftUI)
//
//  Created by Yasir  on 12/19/21.
//

import Foundation

struct images:Hashable,Codable
{
    let id:String
    let created_at: String
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
}

