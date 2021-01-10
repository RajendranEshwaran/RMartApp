//
//  SearchedContentView.swift
//  RMartApp
//
//  Created by RMart on 1/7/21.
//

import SwiftUI

struct SearchedContentView: View {
    @EnvironmentObject var setting:Settings
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
        ScrollView(.vertical, showsIndicators: false, content: {

            
            HStack
            {
                VStack(alignment:.leading){
                    Text("Scan with QRCode").bold().font(.system(size: 12)).padding(.trailing,150)
                    Text("Find all your favroute products").font(.system(size: 12))

                }

                Button(action: {}, label: {
                    Image(systemName: "qrcode.viewfinder")
                    Text("scan")
                }).frame(width:100).overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5).foregroundColor(Color.gray))
            }.frame(width:UIScreen.main.bounds.width,height: 50).background(Color.white.opacity(1))

        }).background(Color.gray.opacity(0.2)).frame(height:UIScreen.main.bounds.height).padding(.top,115)
        .edgesIgnoringSafeArea(.all)
        }.onDisappear(){
            setting.showSearchWindow = false
        }
        
    }
}

struct SearchedContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchedContentView()
    }
}
