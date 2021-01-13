//
//  TestView.swift
//  RMartApp
//
//  Created by gomathi saminathan on 1/6/21.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        //LocationPopupView1()
        test1()
    }
}
struct test1:View {
    var body: some View
    {
        HStack{
            ZStack{
                Image("test1").resizable()
                    .frame(width: 120, height: 150, alignment: .leading).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
                Image("offers")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                    .frame(width: 30, height: 30, alignment: .leading)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 100))
            }
            
           
            
        }
    }
}

struct LocationPopupView1: View
{
    @State private var pincode:String = "19355"
    var body: some View
    {
        VStack{
            HStack
            {
                Text("Where do you want to delivery?").padding()
                Spacer(minLength:0)
                Button(action: {
                    print("close")
                }, label: {
                    Image(systemName: "xmark").padding()
                })
                
            }
            Spacer(minLength: 0)
            VStack{
                Text("Get the access to you Addresses,Orders,Wishlist").font(.system(size: 10)).padding(.trailing,100)
                Spacer(minLength: 0)
            }
            VStack{
            Button(action: {}, label: {
                Text("Sign in to see Your Addresses").bold().frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height/20).foregroundColor(.white)
            }).background(Color("blueTheme"))
               
                Divider().border(Color.black, width: 10)
                Text("Or Enter Pincode").bold().padding(.trailing,250).font(.system(size: 15))
                Text("Select pincode to see product availability").padding(.trailing,170).font(.system(size: 10))
                HStack {
                    Image("map2").resizable().frame(width:20,height: 30).aspectRatio(contentMode: .fit)
                    TextField("", text: .constant("Enter Pincode")).foregroundColor(Color.red).font(Font.custom("Papyrus", size: 16)).frame(height:20)
                    Button(action: {}, label: {
                        Text("Apply").foregroundColor(.red).font(.system(size: 15))
                    })
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5).foregroundColor(Color.black))
                Spacer(minLength:50)
                Divider().border(Color.black, width: 10)
            }

        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3).background(Color.white.opacity(1.0))
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
