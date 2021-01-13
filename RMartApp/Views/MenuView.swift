//
//  MenuView.swift
//  RMart
//
//  Created by RMart on 12/22/20.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var setting: Settings
    @State private var showSigoutAlert:Bool = false
    var body: some View {
       
        VStack{
            Spacer(minLength: 50)
            Group{
            HStack{
                Image(systemName: "person.crop.circle").foregroundColor(.white)
                Text("User Name")
                Spacer(minLength: 0)
                Button(action: {
                    withAnimation{
                        setting.showMenu = false
                    }
                }, label: {
                    Image(systemName: "xmark")
                })
                
            }}
            Group{
            Button(action: { withAnimation{
                setting.showMenu = false
                
            }}, label: {
                Text("Home").foregroundColor(.white).padding(.trailing,150)
            }).padding()
            
            Button(action: { withAnimation{
                setting.showMyAccount.toggle()

            }}, label: {
                Text("My Account").foregroundColor(.white).padding(.trailing,100)
            })
            
            Button(action: {
                setting.showShopCategory.toggle()
            }, label: {
                Text("Shop By Category").padding(.trailing,60).foregroundColor(.white)
            }).padding()
            
            Button(action: {
                setting.showMyOrders.toggle()
            }, label: {
                Text("My Orders").padding(.trailing,125).foregroundColor(.white)
            }).padding()
            
            Button(action: {
                setting.showWallet.toggle()
            }, label: {
                Text("RMart Wallet").padding(.trailing,115).foregroundColor(.white)
            }).padding()
            
            Button(action: {
                setting.showMySubscription.toggle()
            }, label: {
                Text("My Subscription").padding(.trailing,85).foregroundColor(.white)
            }).padding()
            
            Button(action: {
                setting.showAllOffers.toggle()
            }, label: {
                Text("All Offers").padding(.trailing,135).foregroundColor(.white)
            }).padding()
        }
            VStack{
                Divider()
                Text("Help and Settings").padding(.trailing,120).foregroundColor(.gray)
                
                Button(action: {
                    setting.showCustomerService.toggle()
                }, label: {
                    Text("Customer Service").padding(.trailing,95).foregroundColor(.white)
                }).padding()
                
                Button(action: {
                    setting.showGuide.toggle()
                }, label: {
                    Text("Guide").padding(.trailing,180).foregroundColor(.white)
                }).padding()
                
                
                Button(action: {withAnimation{
                    if(setting.isSigned)
                    {
                        //setting.showMenu = false
                        self.showSigoutAlert.toggle()
                    }
                    else
                    {
                        setting.showSign.toggle()
                    }
                    
                }}, label: {
                    if(setting.isSigned)
                    {
                        Text("Sign Out").padding(.trailing,160).foregroundColor(.white)
                    }
                    else
                    {
                        Text("Sign In/Sign Up").padding(.trailing,100).foregroundColor(.white)
                    }
                    
                }).padding()
                .alert(isPresented: $showSigoutAlert) { () -> Alert in
                    let primaryButton = Alert.Button.default(Text("Yes")) {
                        print("primary button pressed")
                        setting.isSigned = false
                        setting.showMenu = false
                        self.showSigoutAlert = false
                    }
                    let secondaryButton = Alert.Button.cancel(Text("No")) {
                        print("secondary button pressed")
                        setting.showMenu = false
                        self.showSigoutAlert = false
                    }
                    return Alert(title: Text("Hey username!"), message: Text("Do you want to sign out?"), primaryButton: primaryButton, secondaryButton: secondaryButton)
                }
                
            }
            Spacer()
        
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(UIColor(red: 97/255, green: 193/255, blue: 237/255, alpha: 1.0)))
            .edgesIgnoringSafeArea(.all)
    }
    
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

