//
//  DeliveryAddressView.swift
//  RMartApp
//
//  Created by RMart on 12/28/20.
//

import SwiftUI

struct DeliveryAddressView:View {
    @State private var pincode:String = "19355"
    @State private var select:Int = 1
    @State var isChecked:Bool = false
    @State var isAdd:Bool = false
    @State var isModify:Bool = false
    var body: some View{
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                Label("Deliver to \(pincode)", systemImage: "mappin").frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight")).foregroundColor(.white).font(.title3)
            }
            Spacer(minLength:0)
            Text("Delivery Address").font(.title)
            Spacer(minLength:20)
            Button(action: {
                withAnimation{
                self.isAdd.toggle()
                }
            }, label: {
                Text("+  Add New Address").frame(width: 350, height: 40).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)).foregroundColor(.gray)
                
            }).frame(width: 350, height: 40).border(Color("blueThemeLight"), width: 1)
            ForEach(0..<0) {id in
                ZStack{
                Rectangle().fill(Color.white).frame(width: 350, height: 200).overlay(
                    RoundedRectangle(cornerRadius: 15).stroke(Color("blueThemeLight")))
                    VStack{
                        HStack{
                            Button(action: toggle, label: {
                                Image(systemName: isChecked ? "checkmark.square": "square")
                                Text("Customer Name")
                            }).padding(20)
                            Spacer(minLength: 20)
                            Text("Home").padding(20)
                            // location type
                            Spacer()
                        }.padding(5)
                        
                        VStack(alignment: .leading, spacing: 0){
                            HStack{
                                Text("171,")
                                Text("AutumnPark Apartment,")
                            }
                            Text("LandMark/Area,")
                            HStack{
                                Text("Maviyur city,Texas State,")
                                Text("PinCode.19345")
                            }
                            Text("Phone Number")
                            
                            Spacer(minLength: 0)
                            Button(action: {}, label: {
                                Text("Modify")
                            })
                        }
                        
                    }
                }
            }
            if(self.isAdd)
            {
                ZStack{
                    Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
                    VStack{
                        NewAddressView(isAdd: self.$isAdd, isModify: self.$isModify).transition(.slide)
                    }
                }
            }
            if(isModify)
            {
                ZStack{
                    Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
                    VStack{
                        ModifyAddressView(isModify: self.$isModify).transition(.slide)
                    }
                }
            }
        }).frame(height:UIScreen.main.bounds.height)
    }
    
    func toggle(){isChecked = !isChecked}
}

struct DeliveryAddressView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryAddressView()
    }
}

struct NewAddressView:View {
    @Binding var isAdd:Bool
    @Binding var isModify:Bool
    @State private var location:String = ""
    var body: some View
    {
        VStack{
            HStack{
                Button(action: {
                    self.isAdd = false
                }, label: {
                    Image(systemName: "xmark")
                })
                Spacer()
                Text("Select Address").bold().foregroundColor(Color("blueTheme"))
                Spacer()
            }
            Divider()
            TextField("Search for your location", text: $location).frame(width: UIScreen.main.bounds.width - 50, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
            Text("or")
            Divider()
            Button(action: {
                
            }, label: {
                HStack{
                Image(systemName: "mappin")
                    Text("Select your location via map")
                }
            })
            Divider()
            Button(action: {
                self.isModify.toggle()
                self.isAdd = false
            }, label: {
                Text("+ Type your address")
            })
           
        Spacer()
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
        
    }
}

struct ModifyAddressView : View {
    @State private var cName:String = ""
    @Binding var isModify:Bool
    var body: some View
    {
        VStack{
            HStack{
                Button(action: {
                    self.isModify = false
                }, label: {
                    Image(systemName: "xmark")
                })
                Spacer()
                Text("Add Address").bold().foregroundColor(Color("blueTheme"))
                Spacer()
            }
            Divider()
           
            VStack{
            TextField("Customer Name", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Phone Number", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Door No", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Apt Name", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Land mark", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("City Name", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("State Name", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Pincode", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
            }
           
            HStack{
                Text("Save as")
                Spacer()
                Button(action: {}, label: {
                    Text("Home")
                }).padding(5)
                Button(action: {}, label: {
                    Text("Work")
                }).padding(5)
                Button(action: {}, label: {
                    Text("Other")
                }).padding(5)
            }
            Spacer()
            Button(action: {}, label: {
                Text("Save Address").foregroundColor(Color("blueTheme")).bold().frame(width: UIScreen.main.bounds.width - 50, height: 40)
            }).overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("blueTheme"), lineWidth: 2))
            
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
        
    }
}
