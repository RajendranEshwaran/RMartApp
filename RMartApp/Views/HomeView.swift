//
//  HomeView.swift
//  RMart
//
//  Created by RMart on 12/20/20.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @State private var searchText:String = ""
    @State var isDrawerOpen: Bool = false
    @State var isCartOpen: Bool = false
    //@State var index = "Home"
    @EnvironmentObject var setting: Settings
    @State private var phoneNumber:String = ""
    
    @ObservedObject var userVM = UserDataListViewModel()
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        setting.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView().onAppear(){//readPhoneNumber()
                        refreshData()
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: setting.showMenu ? geometry.size.width/2 : 0)
                        .disabled(setting.showMenu ? true : false)
                    if setting.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2+100)
                            .transition(.move(edge: .leading))
                    }
                    if(self.isCartOpen)
                    {
                        NavigationLink(destination: MyCartView(), isActive: self.$isCartOpen) {
                        }
                    }
                   
                }
                .gesture(drag)
            }
            .navigationBarTitle("", displayMode: .inline)
            
            .navigationBarItems(leading: HStack{Button(action: {
                withAnimation {
                    setting.showMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
            }
            Spacer(minLength: 140)
            Text("RMart").bold().foregroundColor(.white)
            },trailing: HStack{
                Button(action: {
                    //self.isDrawerOpen.toggle()
                }) {
                    Image(systemName: "person.crop.circle")
                }
                Spacer(minLength: 30)
                Button(action: {
                    self.isCartOpen.toggle()
                }) {
                    Image(systemName: "cart.fill")
                    
                }
                ZStack{
                    Circle().fill(Color.red).frame(width:15,height: 15)
                        .offset(x: -10.0, y: -10.0)
                    Text("0").font(.system(size: 10)) .frame(width:15,height: 15).offset(x: -10.0, y: -10.0)
                }
            }).foregroundColor(.white)
            
            
        }
    }
    func refreshData() {
        self.userVM.fetchAllUserProfile()
        print("\(self.userVM.userProfile.count)")
        if(self.userVM.userProfile.count > 0)
        {
            setting.isSigned = true
        }
    }
    func readPhoneNumber()
    {
//        print(loginDetails[0].phoneNumber ?? "")
//        if(!(loginDetails[0].phoneNumber?.isEmpty ?? true))
//        {
//            setting.isSigned = true
//        }
    }
}
   
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



struct MainView: View {
    @EnvironmentObject var setting: Settings
    @State var selection: Int? = nil
    var body: some View {
       
        VStack{
            Group{
                HomeContentView()
                Group{
                    if(!setting.showLocation)
                    {
                        withAnimation(.easeIn){
                            LocationPopupView()
                        }
                    }
                    if(setting.showSign)
                    {
                        if(setting.isSigned )
                        {
                            NavigationLink(destination: ProfileView(), isActive: $setting.showSign) {
                            }
                        }
                        else
                        {
                            NavigationLink(destination: SignInView(), isActive: $setting.showSign) {
                            }
                        }
                    }
                    if(setting.showMyAccount)
                    {
                        if(setting.isSigned)
                        {
                            NavigationLink(destination: ProfileView(), isActive: $setting.showMyAccount) {
                            }
                        }
                        else
                        {
                            NavigationLink(destination: SignInView(), isActive: $setting.showMyAccount) {
                            }
                        }
                    }
                    if(setting.showWallet)
                    {
                        NavigationLink(destination: MyWalletView(), isActive: $setting.showWallet) {
                        }
                    }
                    if(setting.showAllOffers)
                    {
                        NavigationLink(destination:AllOffersView(),isActive:$setting.showAllOffers)
                        {
                            
                        }
                    }
                    if(setting.showCustomerService)
                    {
                        NavigationLink(destination:CustomerServiceView(),isActive:$setting.showCustomerService)
                        {
                            
                        }
                    }
                    
                    if(setting.showGuide)
                    {
                        NavigationLink(destination:GuideView(),isActive:$setting.showGuide)
                        {
                            
                        }
                    }
                    
                    if(setting.showMyOrders)
                    {
                        NavigationLink(destination:MyOrdersView(isOrderHistoryShown: .constant(false)),isActive:$setting.showMyOrders)
                        {
                            
                        }
                    }
                    
                    if(setting.showMySubscription)
                    {
                        NavigationLink(destination:MySubscriptionView(),isActive:$setting.showMySubscription)
                        {
                            
                        }
                    }
                    
                    if(setting.showShopCategory)
                    {
                        NavigationLink(destination:ShopCategoryView(),isActive:$setting.showShopCategory)
                        {
                            
                        }
                    }
                }
            }
        }
        .onAppear(){
            resetToggle()
        }
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
        setting.showLocation = true
        setting.showSearchWindow = false
        setting.showMyAccount = false
    }
}

struct LocationPopupView: View
{
    @State private var pincode:String = "19355"
    @EnvironmentObject var setting: Settings
    var body: some View
    {
        VStack{
            HStack
            {
                Text("Where do you want to delivery?").padding()
                Spacer(minLength:0)
                Button(action: {
                    withAnimation{
                        print("close")
                        setting.showLocation = true
                    }
                   
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
            }).background(Color("blueTheme")).overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.0).foregroundColor(Color.white))
               
                Divider().border(Color.black, width: 10)
                Text("Or Enter Pincode").bold().padding(.trailing,250).font(.system(size: 15))
                Text("Select pincode to see product availability").padding(.trailing,170).font(.system(size: 10))
                HStack {
                    Image("map2").resizable().frame(width:20,height: 30).aspectRatio(contentMode: .fit)
                    TextField("", text: .constant("Enter Pincode")).foregroundColor(Color.red).frame(height:20)
                    Button(action: {}, label: {
                        Text("Apply").foregroundColor(.white).font(.system(size: 15)).background(Color.red)
                    })
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5).foregroundColor(Color.red))
                Spacer(minLength:50)
               
            }

        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3).background(Color("blueTheme").opacity(1.0))
    }
   
}
