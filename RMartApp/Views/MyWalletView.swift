//
//  MyWalletView.swift.swift
//  RMartApp
//
//  Created by RMart on 12/30/20.
//

import SwiftUI

struct MyWalletView: View {
    var body: some View {
        VStack{
        //Mark:- Header panel and searchbar
         //   HeaderSearchDummyView()
         //   Spacer(minLength:0)
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
                
            }).frame(height:UIScreen.main.bounds.height).padding(.top,110)
        .edgesIgnoringSafeArea(.all)
        }.toolbar(content: {
            ToolbarItem(placement: .principal) {
                            HStack {
                                //Image(systemName: "sun.min.fill").foregroundColor(.white)
                                Text("RMart").font(.headline).foregroundColor(.white)
                            }
                        }
        })
    }
    
}

struct MyWalletView_Previews: PreviewProvider {
    static var previews: some View {
        MyWalletView()
    }
}
