//
//  WebServices.swift
//  RMartApp
//
//  Created by RMart on 1/20/21.
//

import Foundation
import UIKit
import Combine
import SwiftUI

class Webservice {
    
    func getTopCategories(completion: @escaping ([TopCategoriesModel]?) -> ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let posts = try? JSONDecoder().decode([TopCategoriesModel].self, from: data)
        
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }.resume()
        
    }
    
}
