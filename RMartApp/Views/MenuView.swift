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
    @State private var menuText:String = ""
    var menus = ["Home","My Account","Shop By Category","My Orders","My Wallet","My Subscription","All Offers","Customer Service","Guide","SignIn"]
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "person.crop.circle").foregroundColor(.white)
                Text("\(setting.userName)")
                Spacer(minLength: 0)
                Button(action: {
                    withAnimation{
                        setting.showMenu = false
                        resetToggle()
                    }
                }, label: {
                    Image(systemName: "xmark")
                })
                
            }
            ForEach(0..<menus.count,id:\.self){menu in
                Button(action: {
                    withAnimation()
                    {
                        switch menu
                        {
                        case 0:
                            setting.showMenu = false
                            
                        case 1:
                            setting.showMenu = false
                            setting.showMyAccount.toggle()
                        case 2:
                            setting.showMenu = false
                            setting.showShopCategory.toggle()
                        case 3:
                            setting.showMenu = false
                            setting.showMyOrders.toggle()
                        case 4:
                            setting.showMenu = false
                            setting.showWallet.toggle()
                        case 5:
                            setting.showMenu = false
                            setting.showMySubscription.toggle()
                        case 6:
                            setting.showMenu = false
                            setting.showAllOffers.toggle()
                        case 7:
                            setting.showMenu = false
                            setting.showCustomerService.toggle()
                        case 8:
                            setting.showMenu = false
                            setting.showGuide.toggle()
                        case 9:
                            if(setting.isSigned)
                            {
                                //setting.showMenu = false
                                self.showSigoutAlert.toggle()
                            }
                            else
                            {
                                setting.showSign.toggle()
                            }
                        default:
                            break
                        }
                    }
                }, label: {
                    if(menu != 9)
                    {
                        Text("\(menus[menu])").bold().foregroundColor(.white).frame(maxWidth:.infinity,maxHeight: 20,alignment: .leading).padding()
                    }
                    else if(menu == 9){
                        if(setting.isSigned)
                        {
                            Text("Sign Out").bold().foregroundColor(.white).frame(maxWidth:.infinity,maxHeight: 20,alignment: .leading).padding()
                        }
                        else
                        {
                            Text("Sign In/Sign Up").bold().foregroundColor(.white).frame(maxWidth:.infinity,maxHeight: 20,alignment: .leading).padding()
                        }
                    }
                }).alert(isPresented: $showSigoutAlert) { () -> Alert in
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
            
            
        }
        //.padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
        .background(Color(UIColor(red: 97/255, green: 193/255, blue: 237/255, alpha: 1.0)))
        .edgesIgnoringSafeArea(.all)
        
    }
    func resetToggle()
    {
        setting.homeToggle = true
        setting.showMenu = false
        setting.showSign = false
        setting.showWallet = false
        setting.showAllOffers = false
        setting.showGuide = false
        setting.showCustomerService = false
        setting.showMyOrders = false
        setting.showMySubscription = false
        setting.showShopCategory = false
        setting.showSearchWindow = false
        setting.showMyAccount = false
        if(setting.showLocation)
        {
            setting.showLocation = true
        }
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

