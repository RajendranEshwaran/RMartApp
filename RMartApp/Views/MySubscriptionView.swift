//
//  MySubscriptionView.swift
//  RMartApp
//
//  Created by RMart on 1/1/21.
//

import SwiftUI

struct MySubscriptionView: View {
    @State private var pincode:String = "19355"
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack{
                Label("Deliver to \(pincode)", systemImage: "mappin").frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight")).foregroundColor(.white).font(.title3)
            }
            Spacer(minLength:0)
            
        }).frame(height:UIScreen.main.bounds.height).background(Color.gray.opacity(0.2)).padding(.top,100)
    }
}

struct MySubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MySubscriptionView()
    }
}
