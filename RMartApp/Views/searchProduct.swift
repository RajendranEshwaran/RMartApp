//
//  searchProduct.swift
//  RMartApp
//
//  Created by RMart on 1/8/21.
//

import SwiftUI

struct searchProduct: View {
    @State private var pincode:String = "19355"
    @State private var searchText = ""
    @EnvironmentObject var setting: Settings
    var body: some View {
        VStack{
            HStack
            {
                Text("Where do you want to delivery?").foregroundColor(.black)
                Spacer(minLength:0)
                Button(action: {
                    withAnimation{
                        print("close")
                        setting.showLocation = true
                    }
                   
                }, label: {
                    Image(systemName: "xmark").padding().foregroundColor(.black)
                })
            }
            
            Text("Type or paste your shopping list here...").foregroundColor(.black).font(.system(size: 12)).padding(.trailing,200)
            TextField("search your products...", text: $searchText, onEditingChanged: { isEditing in
                            }, onCommit: {
            
                                print("onCommit")
                            }).foregroundColor(.primary).background(Color.white).frame(width:UIScreen.main.bounds.width, height: 50)
            
            HStack{
                Button(action: {}, label: {
                    Text("Cancel").foregroundColor(.white).frame(width:150).background(Color(.gray))
                }).frame(width:150).background(Color(.gray))
                Spacer(minLength:0)
                Button(action: {}, label: {
                    Text("Search").foregroundColor(.white)
                }).frame(width:150).background(Color(.gray))
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/5).background(Color(.gray).opacity(0.5))
        .cornerRadius(15)
    }
}

struct searchProduct_Previews: PreviewProvider {
    static var previews: some View {
        searchProduct()
    }
}

