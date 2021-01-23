//
//  TopCategories.swift
//  RMartApp
//
//  Created by RMart on 1/20/21.
//

import Foundation

struct TopCategoriesModel: Codable,Identifiable {
    let id: UUID
    let categoryName: String
    let categoryThumbnail: URL?
}
