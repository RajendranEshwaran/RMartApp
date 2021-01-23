//
//  DeliveryAddressView.swift
//  RMartApp
//
//  Created by RMart on 12/28/20.
//

import SwiftUI
import CoreLocation
import MapKit

struct DeliveryAddressView:View {
    @EnvironmentObject var setting:Settings
    @State private var select:Int = 1
    @State var isChecked:Bool = false
    @State var isAdd:Bool = false
    @State var isModify:Bool = false
    @State private var isAddFromMap:Bool = false
    var body: some View{
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                Label("Deliver to \(setting.pinCode)", systemImage: "mappin").frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight")).foregroundColor(.white).font(.title3)
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
                        NewAddressView(isAdd: self.$isAdd, isModify: self.$isModify, isAddFromMap: $isAddFromMap).transition(.slide)
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
            
            if(self.isAddFromMap)
            {
                ZStack{
                    Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
                    VStack{
                        
                        AddressAddFromMapView(isAddFromMap: self.$isAddFromMap).transition(.slide)
                    }
                }
            }
        }).frame(height:UIScreen.main.bounds.height).padding(.top,115)
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
    @Binding var isAddFromMap:Bool
    @State private var location:String = ""
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var showLocationAlert:Bool = false
    
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View
    {
        Group{
            VStack{
                Group{
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
                }
                Divider()
                Group{
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("Search for your location", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary).frame(width: UIScreen.main.bounds.width - 130, height: 40)
                        
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                        
                        if showCancelButton  {
                            Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                            }
                            .foregroundColor(Color(.systemBlue))
                        }
                        
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    
                    Divider()
                    Text("or")
                    Divider()
                    Button(action: {
                        self.showLocationAlert.toggle()
                        
                    }, label: {
                        HStack{
                            Image("currentlocation1").resizable().aspectRatio(contentMode: .fit).contentShape(Circle()).frame(width: 40, height: 40)
                            Text("Use your current location")
                        }
                    }).alert(isPresented: $showLocationAlert) { () -> Alert in
                        let primaryButton = Alert.Button.default(Text("Ok")) {
                            self.isAddFromMap.toggle()
                            
                            self.showLocationAlert = false
                            self.isAdd = false
                        }
                        let secondaryButton = Alert.Button.cancel(Text("Don't Allow")) {
                            print("secondary button pressed")
                            self.showLocationAlert = false
                        }
                        return Alert(title: Text("Hey"), message: Text("RMart require current location"), primaryButton: primaryButton, secondaryButton: secondaryButton)
                    }
                    Divider()
                    Button(action: {
                        self.isModify.toggle()
                        self.isAdd = false
                    }, label: {
                        Text("+ Add your address manually")
                    })
                    
                    Spacer()
                    
                }
                
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
            
        }
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

struct AddressAddFromMapView :View
{
    @Binding var isAddFromMap:Bool
    @ObservedObject var lm = LocationManager()
    var latitude: String  { return("\(lm.location?.latitude ?? 0)") }
    var longitude: String { return("\(lm.location?.longitude ?? 0)") }
    var placemark: String { return("\(lm.placemark?.description ?? "XXX")") }
    var status: String    { return("\(lm.status)") }
    @State var lat: Double = 0.0
    @State var lon: Double = 0.0
    @State private var cName:String = ""
    @State var landmarks: [Landmark] = [
    ]
    @State var selectedLandmark: Landmark? = nil
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: true, content: {
           
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        self.isAddFromMap = false
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    Spacer()
                    Text("Select Address").bold().foregroundColor(Color("blueTheme"))
                    Spacer()
                }
                Divider()
                VStack{
                    MapView(landmarks: $landmarks,
                            selectedLandmark: $selectedLandmark,lat: $lat,lon: $lon)
                        .edgesIgnoringSafeArea(.vertical)
                    
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3).background(Color.gray)
                VStack{
                    Text("Fetched Map Address").frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).multilineTextAlignment(.leading).font(.system(size: 12))

                    TextField("Phone Number", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("Apt Name", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("Apt No", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("Land mark", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("City Name", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("State Name", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("Pincode", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {}, label: {
                        Text("Save Address").foregroundColor(Color("blueTheme")).bold().frame(width: UIScreen.main.bounds.width - 50, height: 40)
                    }).overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("blueTheme"), lineWidth: 2))
                }
                Spacer()
                
            }
        }).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .onAppear(){
            lat = Double( self.latitude) ?? 0.0
            lon = Double( self.longitude) ?? 0.0
            landmarks.append(Landmark(name: "current location", location: .init(latitude: Double( self.latitude) ?? 0.0, longitude: Double( self.longitude) ?? 0.0)))
            print("location : \(self.latitude), \(self.longitude), \(self.placemark), \(self.status)")
        }
    }
}

struct Landmark: Equatable {
    static func ==(lhs: Landmark, rhs: Landmark) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID().uuidString
    let name: String
    let location: CLLocationCoordinate2D
}
