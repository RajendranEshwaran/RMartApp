//
//  ListViewModelForService.swift
//  RMartApp
//
//  Created by RMart on 1/20/21.
//

import Foundation

class ListViewModelForService: ObservableObject {
    @Published var category = [TopCategoryViewModel]()
    
    init() {
        
        Webservice().getTopCategories { categories in
            
            if let cat = categories {
                self.category = cat.map(TopCategoryViewModel.init)
            }
        }
        
    }
    
}

struct TopCategoryViewModel {
    
    var topCategory: TopCategoriesModel
    
    init(tc: TopCategoriesModel) {
        self.topCategory = tc
    }
    
    var id: UUID {
        return self.topCategory.id
    }
    
    var name: String {
        return self.topCategory.categoryName
    }
    
    var thumbnail: URL? {
        return self.topCategory.categoryThumbnail ?? URL.init(fileURLWithPath: "")
    }
    
}

/*
 @ObservedObject private var postListVM = PostListViewModel()
     
     var body: some View {
         
         List(self.postListVM.posts, id: \.id) { post in
             
             VStack(alignment: .leading) {
                 Text(post.title).font(.title)
                 Text(post.body)
             }
         }
         
     }
 */
