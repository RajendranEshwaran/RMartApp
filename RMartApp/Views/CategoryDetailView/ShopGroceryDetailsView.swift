//
//  ShopGroceryDetailsView.swift
//  RMartApp
//
//  Created by RMart on 1/28/21.
//

import SwiftUI

struct ShopGroceryDetailsView: View {
    @EnvironmentObject var setting:Settings
    private let vmManager = ViewModelManager()
    @ObservedObject var userVM = UserDataListViewModel()
    
    @State private var count: Int64 = 0
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false, content: {
//                pincodeBarView()
//                Spacer(minLength:0)
                VStack(){
                    ForEach(0..<TopDeals.topDeals.count){product in
                        
                        HStack{
                            ZStack{
                            Image("test1").resizable().aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .leading).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                Image("offers")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: 30, height: 30, alignment: .leading)
                                    .padding(EdgeInsets(top: 0, leading: 100, bottom: 100, trailing: 0))
                            }
                            VStack{
                                Text("\(TopDeals.topDeals[product].productName ?? "")").bold().font(.system(size: 10)).foregroundColor(.black).frame(maxWidth:.infinity,maxHeight:30,alignment: .leading).padding(.leading,10).multilineTextAlignment(.leading)
                                HStack{
                                    Text("₹\(TopDeals.topDeals[product].productCPrice ?? "")").bold().font(.system(size: 15)).foregroundColor(.black).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                                    Text("₹\(TopDeals.topDeals[product].productAPrice ?? "")").strikethrough() .font(.system(size: 10)).foregroundColor(.black).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                                }
                                Text("Save as ₹\(TopDeals.topDeals[product].productSPrice ?? "")").bold().font(.system(size: 12)).foregroundColor(.green).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                                
                                /*if(TopDeals.topDeals[product].productName != "")
                                {
                                    HStack{
                                        Button(action: { }, label: {
                                            Text("-").bold()
                                                .frame(width:25,height: 25)
                                                .foregroundColor(.white)
                                                .background(Color.blue)
                                                .cornerRadius(20)
                                        })
                                       // Spacer(minLength: 0)
                                        Text("5").padding()
                                        Button(action: { }, label: {
                                            Text("+").bold()
                                                .frame(width:25,height: 25)
                                                .foregroundColor(.white)
                                                .background(Color.blue)
                                                .cornerRadius(20)
                                        })
                                    }
                                    
                                }
                                else
                                {*/
                                    Button(action: {
                                        count = 1
                                        setting.selectedProductCount = setting.selectedProductCount + 1
                                        
                                    }, label: {
                                        Text("ADD     +").bold().font(.system(size: 10)).foregroundColor(.white).frame(width: 140,height:20)
                                    }).frame(width: 100,height:20,alignment:.leading).background(Color("blueTheme")).padding()
                                //}
                            }
                        }
                        Divider()
                        
                    }
                    
                }.background(Color.white)
            }).background(Color.gray.opacity(0.2)).frame(height:UIScreen.main.bounds.height).padding(.top,110)
            .edgesIgnoringSafeArea(.all)
        }.onAppear(){
            
        }
    }
    func fetchSingleProductDetails()
    {
        if(!setting.phoneNumber.isEmpty)
        {
            userVM.fetchSingleProductCartData(phoneNumber: setting.phoneNumber)
            for user in userVM.proCart
            {
                print(user.phoneNumber)
//                self.phoneNumber = user.phoneNumber
//                self.fName = user.firstName ?? ""
//                self.lName = user.lastName ?? ""
//                self.emailid = user.emailId ?? ""
//                self.seletedGender = user.gender ?? ""
//                self.birthDate = user.dob ?? Date()
//                self.pincode = user.pinCode ?? ""
            }
        }
    }
}

struct ShopGroceryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopGroceryDetailsView()
    }
}
