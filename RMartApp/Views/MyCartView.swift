//
//  MyCartView.swift
//  RMartApp
//
//  Created by RMart on 12/30/20.
//

import SwiftUI

struct MyCartView: View {
    @State private var pincode:String = "19355"
    @State private var couponCode:String = ""
    @State private var couponCodeStatus:String = "Please enter your promo code"
    @State private var numberOfItems:Int = 0
    @State private var proName:String = ""
    @State private var actualPrice:String = ""
    @State private var offerPrice:String = ""
    @State private var savedPrice:String = ""
    @State private var isCouponValid:Bool = false
    @State private var totalProductCount:Int = 0
    
    @State private var totalCartPrice:Float64 = 0.0
    @State private var totalMRPPrice:Float64 = 0.0
    @State private var totalDiscountPrice:Float64 = 0.0
    @State private var totalSavedPrice:Float64 = 0.0
    @EnvironmentObject var setting:Settings
    @ObservedObject var userVM = UserDataListViewModel()
    @State private var selectionRow: Set<SingleProductDataViewModel> = []
    @State private var selectedItems: Int? = nil
    var body: some View {
       
       VStack
       {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                Label("Deliver to \(setting.pinCode)", systemImage: "mappin").frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight")).foregroundColor(.white).font(.title3)
                
            }
            Spacer(minLength:0)
            VStack{
                HStack{
                    Text("Groceries Basket").bold().font(.callout)
                    Spacer()
                    Text("(\(numberOfItems) items)").fontWeight(.light)
                }
                Divider()
                // ForEach(0..<totalProductCount){items in
                ForEach(self.userVM.proCart.indices , id:\.self) {items  in
                    HStack(){
                        
                        Image("test1").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80) // pro image
                        VStack(alignment:.leading){
                            
                            Text("\(userVM.proCart[items].productName ?? "")").font(.system(size: 15)).fontWeight(.medium)
                                .padding(2)
                            HStack{
                                
                                Text("₹\(userVM.proCart[items].productCPrice ?? "")").font(.system(size: 15))
                                Spacer(minLength: 0)
                                Text("₹\(userVM.proCart[items].productAPrice ?? "")").font(.system(size: 12)).foregroundColor(.red).strikethrough()
                                Spacer(minLength: 0)
                                Text("You Save ₹\(userVM.proCart[items].productSPrice ?? "")").font(.system(size: 12)).foregroundColor(.green)
                                Spacer(minLength: 0)
                            }
                            Spacer(minLength: 0)
                            HStack{
                                Spacer(minLength: 0)
                                Button(action: {
                                    self.selectedItems = items
                                    if totalProductCount > 0
                                    {
                                    totalProductCount = Int(userVM.proCart[items].productCount - 1)
                                    userVM.proCart[items].productCount = Int64(totalProductCount)
                                    }
                                   
                                }, label: {
                                    Text("-").bold()
                                        .frame(width:25,height: 25)
                                        .foregroundColor(.white)
                                        .background(Color.blue)
                                        .cornerRadius(20)
                                })
                                Spacer(minLength: 0)
                                if self.selectedItems == items && totalProductCount >= 0
                                {
                                    Text("\(totalProductCount) ")
                                }
                                else
                                {
                                    Text("\(userVM.proCart[items].productCount) ")
                                }
                                
                                Spacer(minLength: 0)
                                Button(action: {
                                    self.selectedItems = items
                                    if totalProductCount >= 0
                                    {
                                    totalProductCount = Int(userVM.proCart[items].productCount + 1)
                                    userVM.proCart[items].productCount = Int64(totalProductCount)
                                    
                                    }
                                    
                                }, label: {
                                    Text("+").bold()
                                        .frame(width:25,height: 25)
                                        .foregroundColor(.white)
                                        .background(Color.blue)
                                        .cornerRadius(20)
                                })
                                Spacer(minLength: 20)
                            }
                        }
                    }
                    Divider()
                }
            }
            VStack{
                Form{
                    HStack{
                        Text("Apply Coupon").bold()
                        Spacer(minLength: 0)
                    }
                    HStack{
                        Spacer(minLength: 0)
                        Image(systemName: "ticket.fill")
                        TextField("Promo Code", text: $couponCode, onEditingChanged: { (changing) in
                            print("Changing: \(changing)")
                        }, onCommit: {
                            print("Committed!")
                        }).frame(width: UIScreen.main.bounds.width - 160, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer(minLength: 0)
                        Button(action: {
                            print("coupon")
                            promoCodeVerify()
                        }, label: {
                            Text("Apply")
                        })
                    }
                    if(isCouponValid)
                    {
                        Text("\(couponCodeStatus)").foregroundColor(.green).font(.system(size: 15))
                    }
                    else
                    {
                        Text("\(couponCodeStatus)").foregroundColor(.red).font(.system(size: 15))
                    }
                }
            }.frame(width: UIScreen.main.bounds.width, height: 180)
            
            VStack(alignment:.leading,spacing:20){
                Form{
                    HStack{
                        Text("Payment Details").bold()
                        Spacer(minLength: 0)
                    }
                    HStack{
                        Text("MRP Total").padding(.leading,5)
                        Spacer(minLength: 20)
                        Text("₹\(totalMRPPrice)").padding(.trailing,5)
                    }
                    HStack{
                        Text("Product Discount").padding(.leading,5)
                        Spacer(minLength: 20)
                        Text("- ₹\(totalDiscountPrice)").padding(.trailing,5)
                    }
                    HStack{
                        Text("Total Amount").bold().padding(.leading,5)
                        Spacer(minLength: 20)
                        Text("₹\(totalCartPrice)").bold().padding(.trailing,5)
                    }
                    HStack{
                        Spacer(minLength: 20)
                        Text("You Save ₹\(totalSavedPrice)").foregroundColor(.green).font(.system(size: 13))
                    }
                }
                
                
            }.frame(width: UIScreen.main.bounds.width, height: 250)
            
            
        }).frame(height:UIScreen.main.bounds.height - 150)
     
        HStack{
            TabBarIcon(width: UIScreen.main.bounds.width, height: 50, totalPrice: $totalCartPrice)
        }
       }.toolbar(content: {
        ToolbarItem(placement: .principal) {
            HStack {
                //Image(systemName: "sun.min.fill").foregroundColor(.white)
                Text("RMart").font(.headline).foregroundColor(.white)
            }
        }
       })
       .onAppear(){
        userVM.fetchSingleProductCartDataAllFromCoreData()
        for cart in userVM.proCart
        {
            totalCartPrice = totalCartPrice + (Float64(cart.productCPrice ?? "") ?? 0)
            totalMRPPrice = totalMRPPrice + (Float64(cart.productAPrice ?? "") ?? 0)
            totalDiscountPrice = totalDiscountPrice + (Float64(cart.productSPrice ?? "") ?? 0)
            totalSavedPrice = totalDiscountPrice
            numberOfItems = numberOfItems + 1
            print("\(totalCartPrice), \(numberOfItems)")
        }
       }
       .onDisappear(){
        totalCartPrice = 0.0
        numberOfItems = 0
        totalMRPPrice = 0.0
        totalDiscountPrice = 0.0
        totalSavedPrice = 0.0
       }
    }
    func promoCodeVerify()
    {
        
    }
}

struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}

struct TabBarIcon: View {
     
     let width, height: CGFloat
    @Binding var totalPrice:Float64
    @State private var checkout:Bool = false
     var body: some View {
         VStack {
            HStack{
                Spacer()
                VStack
                {
                    HStack
                    {
                    Text("Payable Amount").font(.system(size: 10))
                    }
                    Spacer()
                    Text("Rs.\(totalPrice)").bold().font(.system(size: 18)).padding(.bottom,10)
                }
                Spacer()
                Button(action: {
                    checkout.toggle()
                }, label: {
                    Text("Place Order").bold().font(.system(size: 13))
                        .frame(width:120,height: 30)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                })
                .background(Color.white)
                .padding(30)
            }
         }.frame(width: width, height: height).background(Color.white).border(Color.black, width: 0.5)
        
        if checkout
        {
            NavigationLink(destination: CheckOutView(), isActive: $checkout) {
                
            }
        }
     }
 }
