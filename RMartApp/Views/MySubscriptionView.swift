//
//  MySubscriptionView.swift
//  RMartApp
//
//  Created by RMart on 1/1/21.
//

import SwiftUI

struct MySubscriptionView: View {
    var body: some View {
        VStack{
             //Mark:- Header panel and searchbar
           // HeaderSearchDummyView()
        // Spacer(minLength:0)
        ScrollView(.vertical, showsIndicators: false, content: {
            pincodeBarView()
            Spacer(minLength:0)
            
        }).frame(height:UIScreen.main.bounds.height).background(Color.gray.opacity(0.2)).padding(.top,100)
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

struct MySubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MySubscriptionView()
    }
}
