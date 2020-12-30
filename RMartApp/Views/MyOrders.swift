//
//  MyOrders.swift
//  RMartApp
//
//  Created by gomathi saminathan on 12/28/20.
//

import SwiftUI

struct MyOrders: View {
    @State private var pincode:String = "19355"
    @State private var select:Int = 1
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                Label("Deliver to \(pincode)", systemImage: "mappin").frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight")).foregroundColor(.white).font(.title3)
            }
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
        }).frame(height:UIScreen.main.bounds.height)
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
struct MyOrders_Previews: PreviewProvider {
    static var previews: some View {
        MyOrders()
    }
}

struct OrdersView:View {
    var body: some View{
        
        VStack{
            Label(
                title: { Text("Filter") },
                icon: { Image(systemName: "line.horizontal.3.decrease.circle") })
            Spacer(minLength: 0)
            List{
            ForEach(0..<20){id in
               Text("My orders")
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


