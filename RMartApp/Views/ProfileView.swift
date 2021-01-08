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
    @State private var isAddressShown:Bool = false
    @State private var isPaymentShown :Bool = false
    @State private var isOrderHistoryShown :Bool = false
    var body: some View {
        ZStack{
            VStack{
                HeaderSearchDummyView()
                Spacer(minLength:0)
                ScrollView(.vertical, showsIndicators: false, content: {
                    pincodeBarView()
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
                                //                        withAnimation{
                                //
                                //                        }
                                self.isPresented.toggle()
                                
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
                            Button(action: {
                                withAnimation{
                                    self.isPaymentShown.toggle()
                                }
                            }, label: {
                                Text("Payment Methods").frame(width: 170, height: 40).overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 2)).foregroundColor(.white)
                            }).frame(width: 170, height: 40).padding(.leading,10)
                            
                            
                            Button(action: {
                                withAnimation{
                                    self.isOrderHistoryShown.toggle()
                                }
                            }, label: {
                                Text("Order History").frame(width: 170, height: 40).overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 2)).foregroundColor(.white)
                            }).background(Color("blueThemeLight")).frame(width: 170, height: 40).padding(.trailing,10)
                            
                        }
                        Spacer(minLength: 0)
                        Button(action: {
                            withAnimation{
                                self.isAddressShown.toggle()
                            }
                        }, label: {
                            
                            Text("Delivery Addresses").frame(width: 350, height: 40).overlay(
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
                    
                })//.frame(height:UIScreen.main.bounds.height).padding(.top,115)
            }
            if(self.isPresented)
            {
                ZStack{
                    Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
                    VStack{
                        EditView()
                    }.animation(.easeIn)
                }
            }
            if(self.isAddressShown)
            {
                NavigationLink(destination: DeliveryAddressView(), isActive: self.$isAddressShown) {
                    
                }
            }
            
            if(self.isPaymentShown)
            {
                ZStack{
                    Color.white.opacity(1.0).edgesIgnoringSafeArea(.all)
                    
                    PaymentView(isPaymentShown: self.$isPaymentShown).transition(.slide)
                    
                }
            }
            if(self.isOrderHistoryShown)
            {
                ZStack{
                    Color.white.opacity(1.0).edgesIgnoringSafeArea(.all)
                    
                    MyOrdersView(isOrderHistoryShown: self.$isOrderHistoryShown).transition(.slide)
                    
                }
            }
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

        VStack{
            
            HStack{
                
                Button(action: {
                    print("close ")
                    
                }, label: {
                    
                    Image(systemName: "xmark.circle")
                    
                }).padding(.top,5).padding(.leading,662)
            }
            
            Spacer()
          
        }.background(Color.yellow)
        .frame(width: 300,height: 500)
       
    }
}


struct PaymentView: View {
    @State private var pincode:String = "19355"
    @Binding var isPaymentShown:Bool
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false, content: {
                HStack{
                    Button(action: {
                        self.isPaymentShown = false
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    Spacer()
                    Text("Payment Methods").bold().font(.title).foregroundColor(Color("blueTheme"))
                    Spacer()
                }
                Divider()
                HStack{
                    Text("SAVED CARDS").font(.system(size: 10))
                    Spacer()
                }
                Divider()
            Spacer()
            }).frame(height:UIScreen.main.bounds.height - 150)
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
     
    }
}

