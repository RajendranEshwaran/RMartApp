//
//  CustomerServiceView.swift
//  RMartApp
//
//  Created by RMart on 1/3/21.
//

import SwiftUI

struct CustomerServiceView: View {
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

struct CustomerServiceView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerServiceView()
    }
}
