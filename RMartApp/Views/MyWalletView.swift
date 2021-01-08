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
        //Mark:- Header panel and searchbar
            HeaderSearchDummyView()
            Spacer(minLength:0)
        ScrollView(.vertical, showsIndicators: false, content: {
            pincodeBarView()
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
                
            })//.frame(height:UIScreen.main.bounds.height).padding(.top,110)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct MyWalletView_Previews: PreviewProvider {
    static var previews: some View {
        MyWalletView()
    }
}
