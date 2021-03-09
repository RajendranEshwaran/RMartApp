//
//  MyCartView.swift
//  RMartApp
//
//  Created by RMart on 12/30/20.
//

import SwiftUI

struct MyCartView: View {
    @State private var pincode:String = "19355"
    @State private var couponCode:String = "Promo Code"
    @State private var couponCodeStatus:String = "Please enter your promo code"
    @State private var numberOfItems:Int = 2
    @State private var proName:String = "Dorties 500g "
    @State private var actualPrice:String = "200.00"
    @State private var offerPrice:String = "165.00"
    @State private var savedPrice:String = "35.00"
    @State private var isCouponValid:Bool = false
    @EnvironmentObject var setting:Settings
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
                ForEach(0..<10){items in
                    
                    HStack(){
                        
                        Image("test1").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80) // pro image
                        VStack(alignment:.leading){
                            
                            Text("\(proName)").font(.system(size: 15)).fontWeight(.medium)
                                .padding(2)
                            HStack{
                                
                                Text("₹\(offerPrice)").font(.system(size: 15))
                                Spacer(minLength: 0)
                                Text("₹\(actualPrice)").font(.system(size: 12)).foregroundColor(.red).strikethrough()
                                Spacer(minLength: 0)
                                Text("You Save ₹\(savedPrice)").font(.system(size: 12)).foregroundColor(.green)
                                Spacer(minLength: 0)
                            }
                            Spacer(minLength: 0)
                            HStack{
                                Spacer(minLength: 0)
                                Button(action: { }, label: {
                                    Text("-").bold()
                                        .frame(width:25,height: 25)
                                        .foregroundColor(.white)
                                        .background(Color.blue)
                                        .cornerRadius(20)
                                })
                                Spacer(minLength: 0)
                                Text("3")
                                Spacer(minLength: 0)
                                Button(action: { }, label: {
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
                        TextField("", text: $couponCode).frame(width: UIScreen.main.bounds.width - 160, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer(minLength: 0)
                        Button(action: {}, label: {
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
                        Text("₹\("1,500.00")").padding(.trailing,5)
                    }
                    HStack{
                        Text("Product Discount").padding(.leading,5)
                        Spacer(minLength: 20)
                        Text("- ₹\("500.00")").padding(.trailing,5)
                    }
                    HStack{
                        Text("Total Amount").bold().padding(.leading,5)
                        Spacer(minLength: 20)
                        Text("₹\("1,500.00")").bold().padding(.trailing,5)
                    }
                    HStack{
                        Spacer(minLength: 20)
                        Text("You Save ₹\("500.00")").foregroundColor(.green).font(.system(size: 13))
                    }
                }
                
                
            }.frame(width: UIScreen.main.bounds.width, height: 250)
            
            
        }).frame(height:UIScreen.main.bounds.height - 150)
     
        HStack{
            TabBarIcon(width: UIScreen.main.bounds.width, height: 50)
        }
       }.toolbar(content: {
        ToolbarItem(placement: .principal) {
                        HStack {
                            //Image(systemName: "sun.min.fill").foregroundColor(.white)
                            Text("RMart").font(.headline).foregroundColor(.white)
                        }
                    }
    })
       
    }
    
}

struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}

struct TabBarIcon: View {
     
     let width, height: CGFloat
    
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
                    Text("Rs.1,000.0000000").bold().font(.system(size: 18)).padding(.bottom,10)
                }
                Spacer()
                Button(action: {}, label: {
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
     }
 }
