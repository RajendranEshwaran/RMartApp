//
//  TestView.swift
//  RMartApp
//
//  Created by gomathi saminathan on 1/6/21.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        //LocationPopupView1()
        //test1()
       // AddressAddFromMapViewTest()
       // editviewTest2()
       // GridView()
        GridView1()
    }
}
struct test1:View {
    var body: some View
    {
        HStack{
            ZStack{
                Image("test1").resizable()
                    .frame(width: 120, height: 150, alignment: .leading).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
                Image("offers")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                    .frame(width: 30, height: 30, alignment: .leading)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 100))
            }
            
           
            
        }
    }
}

struct LocationPopupView1: View
{
    @State private var pincode:String = "19355"
    var body: some View
    {
        VStack{
            HStack
            {
                Text("Where do you want to delivery?").padding()
                Spacer(minLength:0)
                Button(action: {
                    print("close")
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
            }).background(Color("blueTheme"))
               
                Divider().border(Color.black, width: 10)
                Text("Or Enter Pincode").bold().padding(.trailing,250).font(.system(size: 15))
                Text("Select pincode to see product availability").padding(.trailing,170).font(.system(size: 10))
                HStack {
                    Image("map2").resizable().frame(width:20,height: 30).aspectRatio(contentMode: .fit)
                    TextField("", text: .constant("Enter Pincode")).foregroundColor(Color.red).font(Font.custom("Papyrus", size: 16)).frame(height:20)
                    Button(action: {}, label: {
                        Text("Apply").foregroundColor(.red).font(.system(size: 15))
                    })
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5).foregroundColor(Color.black))
                Spacer(minLength:50)
                Divider().border(Color.black, width: 10)
            }

        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3).background(Color.white.opacity(1.0))
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

struct AddressAddFromMapViewTest :View
{
    //@Binding var isAddFromMap:Bool
    @State private var cName:String = ""
    var body: some View
    {
        VStack{
            HStack{
                Button(action: {
                    //self.isAddFromMap = false
                }, label: {
                    Image(systemName: "xmark")
                })
                Spacer()
                Text("Select Address").bold().foregroundColor(Color("blueTheme"))
                Spacer()
            }
            Divider()
            VStack{
                
                
                
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
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
        
    }
}

struct editviewTest2 :View
{
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }

        @State private var birthDate = Date()
    @State private var cName:String = ""
    @State var showDatePicker = false
    @State var showMenuPicker = false
    @State var selectedDate:String = ""
    var body: some View
    {
        VStack{
            HStack{
                Button(action: {
                    //self.isAddFromMap = false
                }, label: {
                    Image(systemName: "xmark")
                })
                Spacer()
                Text("Edit Profile").bold().foregroundColor(Color("blueTheme"))
                Spacer()
            }
            Divider()

            VStack{

                TextField("Phone Number", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Email ID", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("First Name", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Last Name", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("dob", text: $selectedDate).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                .onTapGesture {
                    showDatePicker.toggle()
                }
                TextField("Gender", text: $cName).frame(width: UIScreen.main.bounds.width - 30, height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {}, label: {
                            Text("Male")
                        })
                        Button(action: {}, label: {
                            Text("female")
                        })
                        Button(action: {}, label: {
                            Text("Others")
                        })
                    }))
                
                Button(action: {}, label: {
                    Text("Save Changes").foregroundColor(Color("blueTheme")).bold().frame(width: UIScreen.main.bounds.width - 50, height: 40)
                }).overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color("blueTheme"), lineWidth: 2))
                if self.showDatePicker {
                    DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                                   // Text("Select a date")
//                        let formatter1 = DateFormatter()
//                        formatter1.dateStyle = .short
//                        print(formatter1.string(from: birthDate))
//                        selectedDate = formatter1.string(from: birthDate)
                    }.frame(width:400,height: 400)
                }
                
            }
            Spacer()
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
        
    }
}

struct GridView : View{
    var body: some View
    {
        VStack{
            HStack{
                ForEach(0..<3){idx in
                ZStack{
                Rectangle().fill(Color("blueTheme")).frame(width: 100, height: 120).clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                    Image(DemoDatas.topCategoryThumb[1])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 5.0))
                }
                }
            }
        }
        
    }
}
struct GridView1 : View{
    //let data = DemoDatas.map {"item \($0)"}
    let layout = [GridItem(.adaptive(minimum: 120))]
    var body: some View
    {
        ScrollView{
            LazyVGrid(columns:layout,spacing : 20)
            {
                ForEach(0..<DemoDatas.topCategoryName.count){item in
                    //Text("\(item),\(DemoDatas.topCategoryName[item])")
                    ZStack{
                    Rectangle().fill(Color("blueTheme")).frame(width: 110, height: 120).clipShape(RoundedRectangle(cornerRadius: 10))
                    
                        Image(DemoDatas.topCategoryThumb[1])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 70)
                            .clipShape(RoundedRectangle(cornerRadius: 5.0)).padding(.bottom,30)
                        Spacer()
                        Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
            }
        }
    }
}
