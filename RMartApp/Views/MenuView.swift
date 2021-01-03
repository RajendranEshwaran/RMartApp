//
//  MenuView.swift
//  RMart
//
//  Created by RMart on 12/22/20.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var setting: Toggles
   
    var body: some View {
        VStack{
//            VStack(){
//
//
//                HStack{
//
//                    Image(systemName: "person.crop.circle").foregroundColor(.white)
//                    Text("User Name")
//                    Spacer(minLength: 200)
//                Button(action: {}, label: {
//                    Image(systemName: "xmark")
//                })
//
//                }
//            }.padding(.top,100)
//            .edgesIgnoringSafeArea(.top)
            
            Spacer(minLength: 50)
           
            Button(action: { withAnimation{
                setting.showMenu = false
                
            }}, label: {
                    Text("Home").foregroundColor(.white).padding(.trailing,150)
                }).padding()
               
                Button(action: {}, label: {
                    Text("Shop By Category").padding(.trailing,60).foregroundColor(.white)
                }).padding()
                
                Button(action: {}, label: {
                    Text("My Orders").padding(.trailing,125).foregroundColor(.white)
                }).padding()
                
                Button(action: {
                    setting.showWallet.toggle()
                }, label: {
                    Text("RMart Wallet").padding(.trailing,115).foregroundColor(.white)
                }).padding()
                
                Button(action: {}, label: {
                    Text("My Subscription").padding(.trailing,85).foregroundColor(.white)
                }).padding()
                
                Button(action: {}, label: {
                    Text("All Offers").padding(.trailing,135).foregroundColor(.white)
                }).padding()
                
                VStack{
                    Divider()
                    Text("Help and Settings").padding(.trailing,120).foregroundColor(.gray)
                    
                    Button(action: {}, label: {
                        Text("Customer Service").padding(.trailing,95).foregroundColor(.white)
                    }).padding()
                    
                    Button(action: {}, label: {
                        Text("Guide").padding(.trailing,180).foregroundColor(.white)
                    }).padding()
                    
                    Button(action: {withAnimation{
                        setting.showSign.toggle()
                    }}, label: {
                        Text("Sign Out").padding(.trailing,160).foregroundColor(.white)
                    }).padding()
                }
                Spacer()
                
            
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(UIColor(red: 97/255, green: 193/255, blue: 237/255, alpha: 1.0)))
            .edgesIgnoringSafeArea(.all)
        
        
       
    }
    
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

