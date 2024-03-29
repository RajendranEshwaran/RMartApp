//
//  MyOrders.swift
//  RMartApp
//
//  Created by RMart on 12/28/20.
//

import SwiftUI

struct MyOrdersView: View {
    @State private var pincode:String = "19355"
    @State private var select:Int = 1
    @Binding var isOrderHistoryShown:Bool
    var body: some View {
        VStack{
        //Mark:- Header panel and searchbar
        //HeaderSearchDummyView()
        //Spacer(minLength:0)
        ScrollView(.vertical, showsIndicators: false, content: {
            
            pincodeBarView()
            Spacer(minLength:0)
            
            Picker(selection: self.$select, label:Text("1") , content: {
                Text("My Orders").tag(1)
                Text("My Returns").tag(2)
            }).pickerStyle(SegmentedPickerStyle())
            .onChange(of: self.select, perform: { value in
               
                self.select = value
            })
            if(self.select == 1)
            {
                OrdersView()
            }
            else{
                ReturnsView()
            }
        }).frame(height:UIScreen.main.bounds.height).padding(.top,110)
        .edgesIgnoringSafeArea(.all)
        }.toolbar(content: {
            ToolbarItem(placement: .principal) {
                            HStack {
                                //Image(systemName: "sun.min.fill").foregroundColor(.white)
                                Text("RMart").font(.headline).foregroundColor(.white)
                            }
                        }
        })
    }
    
    func segmentChange(_ tag: Int) {
       
    }
}



extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}
struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView(isOrderHistoryShown: .constant(false))
    }
}

struct OrdersView:View {
    @State private var pincode:String = "19355"
    var body: some View{
        
        VStack{
            Label(
                title: { Text("Filter") },
                icon: { Image(systemName: "line.horizontal.3.decrease.circle") })
            Spacer(minLength: 0)
            List{
                ForEach(0..<20){id in
                    Group{
                        VStack{
                            HStack{
                                Text("ORDER PLACED").bold().font(.system(size: 12))
                                Spacer()
                                Text("SHIPPED TO").bold().font(.system(size: 12))
                                Spacer()
                                Text("ORDER #NO").bold().font(.system(size: 12))
                            }
                            HStack{
                                Text("March 11,2021").font(.system(size: 12))
                                Spacer()
                                Text("xxx-xxx-xxx").font(.system(size: 12))
                                Spacer()
                                Text("123-343-3343").font(.system(size: 12))
                            }
//                            Form{
//                                Text("Delivered \("March 12,2021")").bold().font(.system(size: 15))
//                                HStack
//                                {
//                                    Image(systemName: "folder").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100, alignment: .center)
//                                }
//                            }.frame(width: UIScreen.main.bounds.size.width, height: 200,alignment: .leading)
                           
                        }
                    }
                }
                
            }
        }
        .background(Color.white)
        .frame(width:UIScreen.main.bounds.width , height: UIScreen.main.bounds.height - 200)
    }
}


struct ReturnsView:View {
    var body: some View{
        VStack{
            Label(
                title: { Text("Filter") },
                icon: { Image(systemName: "line.horizontal.3.decrease.circle") })
            Spacer(minLength: 0)
            List{
            ForEach(0..<20){id in
               Text("My Returns")
            }
            
            }
        }
        .background(Color.white)
        .frame(width:UIScreen.main.bounds.width , height: UIScreen.main.bounds.height - 200)
    }
}


/*
 ZStack{
     Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
     VStack{
 OrdersView()
     Button(action: {}
            , label: {
             Image(systemName: "xmark").resizable().frame(width: 15, height: 15)
                 .foregroundColor(.black)
     })
     }
 }
 
 struct OrdersView:View {
    var body: some View{
        
        VStack{
           
            ForEach(0..<20){id in
               Text("My orders")
            }
            
            
        }
        .background(Color.white)
        .frame(width:UIScreen.main.bounds.width , height: UIScreen.main.bounds.height - 250)
    }
}*/


