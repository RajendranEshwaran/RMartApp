//
//  AllOffersView.swift
//  RMartApp
//
//  Created by RMart on 1/1/21.
//

import SwiftUI

struct AllOffersView: View {
    @State private var pincode:String = "19355"
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack{
                Label("Deliver to \(pincode)", systemImage: "mappin").frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight")).foregroundColor(.white).font(.title3)
            }
            Spacer(minLength:0)
            HStack{
                Text("All Offters").bold().padding(10)
                Spacer()
            }.frame(width:UIScreen.main.bounds.width,height: 50).background(Color.white.opacity(1))
            ForEach(0..<2){id in
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
        }).frame(height:UIScreen.main.bounds.height).background(Color.gray.opacity(0.2))
    }
}

struct AllOffersView_Previews: PreviewProvider {
    static var previews: some View {
        AllOffersView()
    }
}
