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
                    MainView()
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
            }).foregroundColor(.white)
            
            
        }
    }
    
}
   
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



struct MainView: View {
    @EnvironmentObject var setting: Settings
    var body: some View {
        
        VStack{
            HomeContentView()
//            if !setting.showMenu
//            {
//                HomeContentView()
//            }
            if(setting.showSign)
            {
                
                NavigationLink(destination: ProfileView(), isActive: $setting.showSign) {
                  //  HomeContentView()
                    
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
    }
}
