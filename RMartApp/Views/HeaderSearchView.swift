//
//  HeaderSearchView.swift
//  RMartApp
//
//  Created by RMart on 1/7/21.
//

import SwiftUI

struct HeaderSearchDummyView: View {
    @State private var searchText = ""
    @EnvironmentObject var setting : Settings
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("search your products...", text: $searchText).foregroundColor(.primary)
                    .onTapGesture {
                        if(!setting.showSearchWindow){
                            setting.showSearchWindow.toggle()}
                    }
                Button(action: {
                    
                }) {
                    Image(systemName: "line.horizontal.3")
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "qrcode.viewfinder")
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.white)
            .background(Color("blueTheme"))
            .cornerRadius(2.0)
        }.frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight"))
        if(setting.showSearchWindow)
        {
            NavigationLink(destination:SearchedContentView(),isActive:$setting.showSearchWindow)
            {
                
            }
        }
    }
}
struct HeaderSearchView: View {
    @EnvironmentObject var setting: Settings
    @State private var pincode:String = "19355"
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    var body: some View {
        VStack{
            HStack{
                Image("map2").resizable().frame(width:15,height: 20).aspectRatio(contentMode: .fit)
                Text("Deliver to \(pincode)").underline().foregroundColor(.black).font(.system(size: 12))
                Spacer(minLength: 0)
            }
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("search your products...", text: $searchText, onEditingChanged: { isEditing in
                    //self.showCancelButton = true
                }, onCommit: {
                    print("onCommit")
                }).foregroundColor(.primary)
                .onTapGesture {
                    if(!setting.showSearchWindow){
                        setting.showSearchWindow.toggle()}
                }
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
                
                Button(action: {
                    
                }) {
                    Image(systemName: "line.horizontal.3")
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "qrcode.viewfinder")
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            
        }.frame(width:UIScreen.main.bounds.width,height: 70).background(Color("blueThemeLight"))
        
    }
}


struct pincodeBarView: View {
    @State private var pincode:String = "19355"
    var body: some View
    {
        HStack{
            Image("map2").resizable().frame(width:15,height: 20).aspectRatio(contentMode: .fit)
            Text("Deliver to \(pincode)").underline().foregroundColor(.white).font(.system(size: 12))
            Spacer(minLength: 0)
        }.frame(width: UIScreen.main.bounds.width, height: 30).background(Color("blueTheme"))
    }
}
struct HeaderSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSearchView()
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
