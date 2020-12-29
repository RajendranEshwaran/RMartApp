//
//  UserSlideMenuView.swift
//  RMart
//
//  Created by RMart on 12/21/20.
//

import SwiftUI

struct UserSlideMenuView: View {
    var body: some View {
        VStack{
            VStack(){
                Spacer()
                HStack(){
                    
                    Image(systemName: "person.crop.circle").padding().foregroundColor(.white)
                    Text("User Name     ")
                    Button(action: {}, label: {
                        Image(systemName: "xmark")
                    })
                }
                
            }.padding(.trailing,110).frame(width: UIScreen.main.bounds.size.width, height: 100).background(Color.orange)
            .edgesIgnoringSafeArea(.top)
            Spacer()
            VStack{
                Button(action: {}, label: {
                    Text("Home").padding(.trailing,220).foregroundColor(.black)
                }).padding()
                
                Button(action: {}, label: {
                    Text("Shop By Category").padding(.trailing,120).foregroundColor(.black)
                }).padding()
                
                Button(action: {}, label: {
                    Text("My Orders").padding(.trailing,180).foregroundColor(.black)
                }).padding()
                
                Button(action: {}, label: {
                    Text("RMart Wallet").padding(.trailing,160).foregroundColor(.black)
                }).padding()
                
                Button(action: {}, label: {
                    Text("My Subscription").padding(.trailing,140).foregroundColor(.black)
                }).padding()
                
                Button(action: {}, label: {
                    Text("All Offers").padding(.trailing,190).foregroundColor(.black)
                }).padding()
                
                VStack{
                    Divider()
                    Text("Help and Settings").padding(.trailing,150).foregroundColor(.gray)
                    
                    Button(action: {}, label: {
                        Text("Customer Service").padding(.trailing,130).foregroundColor(.black)
                    }).padding()
                    
                    Button(action: {}, label: {
                        Text("Guide").padding(.trailing,220).foregroundColor(.black)
                    }).padding()
                    
                    Button(action: {}, label: {
                        Text("Sign Out").padding(.trailing,200).foregroundColor(.black)
                    }).padding()
                }
                Spacer()
                
            }
            
        }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height)
        .padding(.trailing,110)
        
    }
}

struct UserSlideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        UserSlideMenuView()
    }
}
