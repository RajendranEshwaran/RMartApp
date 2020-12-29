//
//  HeaderView.swift
//  RMart
//
//  Created by RMart on 12/21/20.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var searchText:String
    @Binding var isDrawerOpen:Bool
    var body: some View {
        
        NavigationView{
            
            Form{
                TextField("Search for products and brands..", text: $searchText)
            }.navigationBarTitle("",displayMode: .inline).background(Color.white)
            .navigationBarItems(leading: HStack{Button(action: {
                self.isDrawerOpen.toggle()
            }) {
                Image(systemName: "line.horizontal.3")
            }
                Spacer(minLength: 140)
                Text("RMart").bold()
            },trailing: HStack{
                Image(systemName: "person.crop.circle")
                Spacer(minLength: 30)
                Image(systemName: "cart.fill")
            }).foregroundColor(.white)
        }
        
            }
        
    
}

extension UINavigationController{
    override open func viewDidLoad() {
        do {
            super.viewDidLoad()//97, 193, 237
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(red: 97/255, green: 193/255, blue: 237/255, alpha: 1.0)
            self.navigationBar.standardAppearance = appearance
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(searchText: .constant(""), isDrawerOpen:.constant(false))
    }
}






