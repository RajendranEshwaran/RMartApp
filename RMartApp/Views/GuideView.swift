//
//  GuideView.swift
//  RMartApp
//
//  Created by RMart on 1/3/21.
//

import SwiftUI

struct GuideView: View {
    @State private var pincode:String = "19355"
    var body: some View {
        //Mark:- Header panel and searchbar
        HeaderSearchDummyView()
        Spacer(minLength:0)
        ScrollView(.vertical, showsIndicators: false, content: {
            pincodeBarView()
            Spacer(minLength:0)
           
        }).background(Color.gray.opacity(0.2))//.frame(height:UIScreen.main.bounds.height).background(Color.gray.opacity(0.2)).padding(.top,115)
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}

