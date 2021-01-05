//
//  MyWalletView.swift.swift
//  RMartApp
//
//  Created by RMart on 12/30/20.
//

import SwiftUI

struct MyWalletView: View {
    @State private var pincode:String = "19355"
    var body: some View {
        
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack{
                    Label("Deliver to \(pincode)", systemImage: "mappin").frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight")).foregroundColor(.white).font(.title3)
                }
                Spacer(minLength:0)
                ForEach(0..<2){id in
                    VStack{
                        Form{
                                HStack{
                                    Text("RMart Wallet")
                                    Spacer(minLength:0)
                                    Image(systemName: "wallet.pass")
                                }
                            Text("₹ 1000.00")
                        }
                        
                    }.frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height/6)
                }
                
            }).frame(height:UIScreen.main.bounds.height).padding(.top,100)
      
    }
}

struct MyWalletView_Previews: PreviewProvider {
    static var previews: some View {
        MyWalletView()
    }
}
