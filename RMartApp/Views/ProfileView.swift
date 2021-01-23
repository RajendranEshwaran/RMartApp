//
//  ProfileView.swift
//  RMart
//
//  Created by RMart on 12/25/20.
//

import SwiftUI
import UIKit
import Combine

struct ProfileView: View {
    @State private var pincode:String = "19355"
    @State private var isPresented :Bool = false
    @State var offset : CGFloat = UIScreen.main.bounds.height - 500
    @State private var isAddressShown:Bool = false
    @State private var isPaymentShown :Bool = false
    @State private var isOrderHistoryShown :Bool = false
    
    @ObservedObject var userVM = UserDataListViewModel()
    private let vmManager = ViewModelManager()
    @EnvironmentObject var setting:Settings
    var body: some View {
        ZStack{
            VStack{
//                HeaderSearchDummyView()
//                Spacer(minLength:0)
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
                                withAnimation{
                                    setting.showProfileEdit.toggle()
                                    //setting.showMyAccount = false
                                }
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
                    
                })//.frame(height:UIScreen.main.bounds.height).padding(.bottom,10)
                //.frame(height:UIScreen.main.bounds.height).padding(.top,0)//.background(Color.black)
                
                if(setting.showProfileEdit)
                {
                        ZStack{
                            Color.white.opacity(1.0).edgesIgnoringSafeArea(.all)
                            VStack{
                                EditView(isPresented: self.$isPresented, vmManager:vmManager, userProfileLVM: userVM).transition(.slide)
                            }
                        }
                }
            }.onDisappear()
            {
                self.isPresented = false
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
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @Binding var isPresented :Bool
    var vmManager: ViewModelManager
    var userProfileLVM: UserDataListViewModel
    @EnvironmentObject var setting:Settings
    @ObservedObject var userSetting = UserSettings()
    
    @State private var birthDate = Date()
    @State var showDatePicker = false
    @State var showMenuPicker = false
    @State var selectedDate:String = ""
    @State var seletedGender:String = ""
    
    @State private var phoneNumber:String = ""
    @State private var fName:String = ""
    @State private var lName:String = ""
    @State private var emailid:String = ""
    @State private var pincode:String = ""
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                
                HStack{
                    Button(action: {
                        self.isPresented = false
                        setting.showProfileEdit = false
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    Spacer()
                    Text("Edit Profile").bold().foregroundColor(Color("blueTheme"))
                    Spacer()
                }
                Divider()
                
                /*VStack{
                    ForEach(self.userProfileLVM.userProfile.indices , id:\.self) {idx  in
                        TextField("Phone Number", text: $phoneNumber).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Email ID", text: $emailid).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("First Name", text: $fName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Last Name", text: $lName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        DatePicker("Date of Birth", selection: $birthDate )
                            .datePickerStyle(CompactDatePickerStyle()).frame(width: UIScreen.main.bounds.width - 30, height: 40)
                        Menu {
                            Button("Male", action: {self.seletedGender = "Male"})
                            Button("Female", action: {self.seletedGender = "Female"})
                            Button("Others", action: {self.seletedGender = "Others"})
                        } label: {
                            TextField("Gender", text: $seletedGender).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        TextField("Pincode", text: $pincode, onEditingChanged: {_ in
                            
                        }, onCommit: {
                            
                        }).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Button(action: {
                        updateUserProfile()
                        
                    }, label: {
                        Text("Save Changes").foregroundColor(Color("blueTheme")).bold().frame(width: UIScreen.main.bounds.width - 50, height: 40)
                    }).overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("blueTheme"), lineWidth: 2))
                    if self.showDatePicker {
                        DatePicker("", selection: $birthDate )
                            .datePickerStyle(CompactDatePickerStyle())
                        
                    }
                    if(self.showMenuPicker)
                    {
                        Menu {
                            Button("Cancel", action: {})
                            Button("Search", action: {})
                            Button("Add", action: {})
                        } label: {
                            Label("Create", systemImage: "plus.circle")
                        }
                    }
                    
                }
                Spacer()*/
                
            }//.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
        }).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
        .onAppear(){
            setting.showProfileEdit = false
            /*setting.phoneNumber = userSetting.getUserPhoneNumber()
            if(!setting.phoneNumber.isEmpty)
            {
                userProfileLVM.fetchUserProfileWithPhonenumber(phoneNumber: setting.phoneNumber)
                for user in userProfileLVM.userProfile
                {
                    print(user.phoneNumber)
                    self.phoneNumber = user.phoneNumber
                    self.fName = user.firstName ?? ""
                    self.lName = user.lastName ?? ""
                    self.emailid = user.emailId ?? ""
                    self.seletedGender = user.gender ?? ""
                    self.birthDate = user.dob ?? Date()
                    self.pincode = user.pinCode ?? ""
                }
            }*/
        }
    }
    func updateUserProfile()
    {
        let userdata = UserProfileDataViewModel(id: UUID(), fname: self.fName, lname: self.lName, gender: self.seletedGender, dob: self.birthDate, phoneNumber: self.phoneNumber, emailId: self.emailid,pinCode: self.pincode)
        vmManager.updateUserProfileData(user: userdata)
        self.isPresented = false
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

