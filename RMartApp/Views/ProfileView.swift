//
//  ProfileView.swift
//  RMart
//
//  Created by RMart on 12/25/20.
//

import SwiftUI
import UIKit

struct ProfileView: View {
    @State private var pincode:String = "19355"
    @State private var isPresented :Bool = false
    @State var offset : CGFloat = UIScreen.main.bounds.height - 500
    var body: some View {
        ZStack{
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                Label("Deliver to \(pincode)", systemImage: "mappin").frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight")).foregroundColor(.white).font(.title3)
            }
            Spacer(minLength:0)
            VStack{
                
                HStack{
                    
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .padding()
                    Text("RMart User credential").bold().foregroundColor(.white)
                    //Text("RMart User").bold().foregroundColor(.white)
                    Spacer(minLength: 20)
                    Button(action: {

                        self.isPresented.toggle()
                        let alertHC = UIHostingController(rootView: EditView())
                        alertHC.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 300)
                        //alertHC.preferredContentSize = CGSize(width: 400, height: 400)
                        alertHC.modalPresentationStyle = UIModalPresentationStyle.custom
                        UIApplication.shared.windows[0].rootViewController?.present(alertHC, animated: true)

                    }, label: {
                        Image(systemName: "pencil")
                            .resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20).foregroundColor(.white).padding(.trailing,10)
//                            .sheet(isPresented: self.$isPresented, content: {
//                                HalfModalView(isShown: self.$isPresented, modalHeight: 400, content: {Text("dfdf")})
//                            })
//                            .sheet(isPresented: self.$isPresented, content: {
//                                CustomActionSheet()
//                                                        })
                    })
                      
                }
                
                HStack {
                    Button(action: {}, label: {
                        Text("Payment Methods").frame(width: 170, height: 40).overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 2)).foregroundColor(.white)
                    }).frame(width: 170, height: 40).padding(.leading,10)
                    
                    
                    Button(action: {}, label: {
                        Text("Order History").frame(width: 170, height: 40).overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 2)).foregroundColor(.white)
                    }).background(Color("blueThemeLight")).frame(width: 170, height: 40).padding(.trailing,10)
                    
                }
                Spacer(minLength: 0)
                Button(action: {}, label: {
                    
                    Text("Order History").frame(width: 350, height: 40).overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 2)).foregroundColor(.white)
                    
                }).background(Color("blueThemeLight")).frame(width: 350, height: 40)
                Spacer(minLength: 0)
            }.frame(width: UIScreen.main.bounds.width, height: 200).background(Color("blueTheme"))
            
            VStack(alignment: .leading, spacing: 20, content: {
                Spacer(minLength: 10)
                Text("My List").padding(.leading,10)
                Divider()
                Text("Legal Information").padding(.leading,10)
                Divider()
                Text("Need Help").padding(.leading,10)
                Divider()
                Text("Contact Us").padding(.leading,10)
            }).contentShape(Rectangle())
            
        }).frame(height:UIScreen.main.bounds.height)
        
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct EditView: View {
    
   
    var body: some View {

        VStack(alignment:.center,spacing : 10) {
            
            HStack{
                
                Button(action: {
                    print("close ")
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                }, label: {
                    
                    Image(systemName: "xmark.circle")
                    
                }).padding(.top,5).padding(.leading,662)
            }
            
            Spacer()
          
        }.background(Color.yellow)
        .frame(width: 300,height: 500)
       
    }
}


