//
//  AllOffersView.swift
//  RMartApp
//
//  Created by RMart on 1/1/21.
//

import SwiftUI

struct AllOffersView: View {
    var body: some View {
        VStack{
        //Mark:- Header panel and searchbar
      //  HeaderSearchDummyView()
      //  Spacer(minLength:0)
        ScrollView(.vertical, showsIndicators: false, content: {
            pincodeBarView()
            Spacer(minLength:0)
            HStack{
                Text("All Offters").bold().padding(10)
                Spacer()
            }.frame(width:UIScreen.main.bounds.width,height: 50).background(Color.white.opacity(1))
            ForEach(0..<5){id in
            VStack{
                HStack{
                    Image(systemName: "wallet.pass").padding(10)
                    Text("Master Card")
                    Spacer()
                }
                Image("mastercard").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/10)
                Spacer()
            }.frame(width:UIScreen.main.bounds.width,height: 170).background(Color.white.opacity(1))
               Spacer(minLength: 10)
            }
            VStack{
                Text("@2020 All rights are reserved")
            }.frame(width:UIScreen.main.bounds.width,height: 50).background(Color.white.opacity(1))
            
        }).frame(height:UIScreen.main.bounds.height).background(Color.green.opacity(0.2)).padding(.top,115)
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

struct AllOffersView_Previews: PreviewProvider {
    static var previews: some View {
        AllOffersView()
    }
}
