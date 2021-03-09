//
//  GuideView.swift
//  RMartApp
//
//  Created by RMart on 1/3/21.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        VStack{
        //Mark:- Header panel and searchbar
       // HeaderSearchDummyView()
       // Spacer(minLength:0)
        ScrollView(.vertical, showsIndicators: false, content: {
            pincodeBarView()//
            Spacer(minLength:0)
           
        }).frame(height:UIScreen.main.bounds.height).background(Color.gray.opacity(0.2)).padding(.top,115)
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

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}


