//
//  TopDealsProductView.swift
//  RMartApp
//
//  Created by RMart on 1/19/21.
//

import SwiftUI

class UpdateCartCount: ObservableObject {
    @Published var phonenumber: String = ""
    @Published var itemcount: Int64 = 0
    @Published var id: String = ""
}

struct TopDealsProductView: View {
    @EnvironmentObject var setting:Settings
    let vmManager = ViewModelManager()
    @ObservedObject var userVM = UserDataListViewModel()
    @State private var proCount:Int = 0
    @State private var countOfProducts = Dictionary<Int, Int>()
    @State private var fetchedProducts = Dictionary<String, Int>()
    @State private var fetchedProductsCount = Dictionary<String, Int>()
    @State private var pId:Int = 0
    @State private var pCount:Int = 0
    @State private var pFlag:Bool = false
    @State private var isFirstCount:Bool = false
    @State private var isFirstProduct:Bool = false
    

    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(){
                    ForEach(0..<TopDeals.topDeals.count){product in
                        Spacer()
                        VStack{
                            HStack{
                                ZStack{
                                    Image("test1").resizable()
                                        .frame(width: 120, height: 150, alignment: .leading).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 100))
                                    Image("offers")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                        .frame(width: 30, height: 30, alignment: .leading)
                                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 100, trailing: 0))
                                }
                            }
                            Spacer()
                            VStack(alignment:.leading,spacing:10){
                                HStack{
                                    Text("₹\(TopDeals.topDeals[product].productCPrice ?? "")").bold().font(.system(size: 15)).foregroundColor(.black).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                                    Text("₹\(TopDeals.topDeals[product].productAPrice ?? "")").strikethrough() .font(.system(size: 10)).foregroundColor(.black).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                                }
                                Text("Save as ₹\(TopDeals.topDeals[product].productSPrice ?? "")").bold().font(.system(size: 12)).foregroundColor(.green).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                                Text("\(TopDeals.topDeals[product].productName ?? "")").bold().font(.system(size: 10)).foregroundColor(.black).frame(maxWidth:.infinity,maxHeight:30,alignment: .leading).padding(.leading,10).multilineTextAlignment(.leading)
                                Button(action: {
                                    
                                    fetchSingleCartDetails()
                                    
                                    setting.selectedProductCount = setting.selectedProductCount + 1
                                    print("\(setting.selectedProductCount)")
                                    
                                    if(!countOfProducts.isEmpty)
                                    {
                                        for (key, _) in countOfProducts {
                                            if(key == product)
                                            {
                                                proCount = countOfProducts[key] ?? 0
                                                proCount = proCount + 1
                                                print("key:\(key)- existing value:\(proCount)")
                                                countOfProducts.updateValue(proCount, forKey: key)
                                                let proName = TopDeals.topDeals[product].productName ?? ""
                                                for (name , value) in fetchedProducts
                                                {
                                                    if(proName == name)
                                                    {
                                                        let prodata = SingleProductDataViewModel(id: UUID(), productCount: Int64(countOfProducts[product] ?? 0 + value), phoneNumber: setting.phoneNumber, productAPrice: TopDeals.topDeals[product].productAPrice ?? "", productCPrice: TopDeals.topDeals[product].productCPrice ?? "", productSPrice: TopDeals.topDeals[product].productSPrice ?? "", productName: TopDeals.topDeals[product].productName ?? "")
                                                        vmManager.updateSingleProductCartData(user: prodata)
                                                    }
                                                }
                                                
                                                
                                                proCount = 0
                                                break
                                            }
                                            else{
                                                if(key != product)
                                                {
                                                    proCount = countOfProducts[product] ?? 0
                                                    proCount = proCount + 1
                                                    print("key:\(key)- new product:\(proCount)")
                                                    countOfProducts[product] = proCount
                                                    let proName = TopDeals.topDeals[product].productName ?? ""
                                                    
                                                    if(fetchedProducts.count > 0)
                                                    {
                                                        for (name , _) in fetchedProducts
                                                        {
                                                            if(proName != name)
                                                            {
                                                                let prodata = SingleProductDataViewModel(id: UUID(), productCount: Int64(countOfProducts[product] ?? 0), phoneNumber: setting.phoneNumber, productAPrice: TopDeals.topDeals[product].productAPrice ?? "", productCPrice: TopDeals.topDeals[product].productCPrice ?? "", productSPrice: TopDeals.topDeals[product].productSPrice ?? "", productName: TopDeals.topDeals[product].productName ?? "")
                                                                vmManager.saveSingleProductCartData(user:prodata )
                                                            }
                                                        }
                                                    }
                                                    else{
                                                        let prodata = SingleProductDataViewModel(id: UUID(), productCount: Int64(countOfProducts[product] ?? 0), phoneNumber: setting.phoneNumber, productAPrice: TopDeals.topDeals[product].productAPrice ?? "", productCPrice: TopDeals.topDeals[product].productCPrice ?? "", productSPrice: TopDeals.topDeals[product].productSPrice ?? "", productName: TopDeals.topDeals[product].productName ?? "")
                                                        vmManager.saveSingleProductCartData(user:prodata )
                                                    }
                                                    
                                                    proCount = 0
                                                    break
                                                }
                                            }
                                        }
                                    }
                                    else{
                                        
                                    proCount = proCount + 1
                                    countOfProducts[product] = proCount
                                        
                                        let proName = TopDeals.topDeals[product].productName ?? ""
                                        if(fetchedProducts.count > 0)
                                        {
                                            for (name , _) in fetchedProducts
                                            {
                                                if(proName != name)
                                                {
                                                    let prodata = SingleProductDataViewModel(id: UUID(), productCount: Int64(countOfProducts[product] ?? 0), phoneNumber: setting.phoneNumber, productAPrice: TopDeals.topDeals[product].productAPrice ?? "", productCPrice: TopDeals.topDeals[product].productCPrice ?? "", productSPrice: TopDeals.topDeals[product].productSPrice ?? "", productName: TopDeals.topDeals[product].productName ?? "")
                                                    vmManager.saveSingleProductCartData(user:prodata )
                                                }
                                            }
                                        }
                                        else{
                                            let prodata = SingleProductDataViewModel(id: UUID(), productCount: Int64(countOfProducts[product] ?? 0), phoneNumber: setting.phoneNumber, productAPrice: TopDeals.topDeals[product].productAPrice ?? "", productCPrice: TopDeals.topDeals[product].productCPrice ?? "", productSPrice: TopDeals.topDeals[product].productSPrice ?? "", productName: TopDeals.topDeals[product].productName ?? "")
                                            vmManager.saveSingleProductCartData(user:prodata )
                                        }
                                        
                                    }
                                    
                                    proCount = 0
                                     // save into dic
                                    print("\(countOfProducts.description) \(Int64(countOfProducts[product] ?? 0))")
                                    updateCartCount()
                                    
                                }, label: {
                                    Text("ADD     +").bold().font(.system(size: 10)).foregroundColor(.white).frame(width: 140,height:20,alignment:.center)
                                }).frame(width: 100,height:20,alignment:.leading).background(Color("blueTheme")).padding(.leading,10)
                            }
                            Spacer()
                        }.frame(width:180,height: 300)
                    }
                    
                }.background(Color.white)
                
            }).background(Color.gray.opacity(0.2)).frame(height:UIScreen.main.bounds.height)
            .edgesIgnoringSafeArea(.all).frame(height:300)
            
        }.onAppear(){
            
            userVM.fetchUserCartItemCount(phoneNumber: setting.phoneNumber)
            
            userVM.fetchSingleProductCartData(phoneNumber: setting.phoneNumber)
            if(userVM.userCart.count > 0)
            {
                isFirstCount = true
            }
            fetchSingleCartDetails()
            fetchCartCount()
        }
    }
    
    func updateCartCount()
    {
        fetchCartCount()
        if(fetchedProductsCount.count > 0)
        {
            let value = fetchedProductsCount["itemCount"] ?? 0
            let procount = UserCartDataViewModel(id: "1", iCount: Int64(setting.selectedProductCount) + Int64(value), phoneNumber: setting.phoneNumber)
                vmManager.updateUserCartCountData(user: procount)
        }
        else{
            let procount = UserCartDataViewModel(id: "1", iCount: Int64(setting.selectedProductCount), phoneNumber: setting.phoneNumber)
                vmManager.saveUserCartData(user: procount)
        }
    }
    
    func fetchSingleCartDetails()
    {
        userVM.fetchSingleProductCartDataAllFromCoreData()
        if(userVM.proCart.count > 0)
        {
            isFirstProduct = true
            for user in userVM.proCart
            {
                fetchedProducts[user.productName ?? ""] = Int(user.productCount)
            }
        }
    }
    func fetchCartCount()
    {
        userVM.fetchUserCartItemCountWithoutPhone()
        if(userVM.userCart.count > 0)
        {
            for user in userVM.userCart
            {
                fetchedProductsCount["1"] = Int(user.itemCount)
            }
        }
    }
}

struct TopDealsProductView_Previews: PreviewProvider {
    static var previews: some View {
        TopDealsProductView()
    }
}
