//
//  SearchedContentView.swift
//  RMartApp
//
//  Created by RMart on 1/7/21.
//

import SwiftUI

struct SearchedContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {

            //Mark:- Header panel and searchbar
            HeaderSearchView()
           // Spacer(minLength:0)
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
    }
}

struct SearchedContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchedContentView()
    }
}
