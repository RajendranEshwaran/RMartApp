//
//  CategoryItemView.swift
//  RMartApp
//
//  Created by RMart on 1/11/21.
//

import SwiftUI

struct CategoryItemView: View {
    @EnvironmentObject var setting:Settings
    @Environment(\.presentationMode) var presentationMode
    @State private var filterProductCount:Int = 5
    var body: some View {
        VStack{
        ScrollView(.vertical, showsIndicators: false, content: {
            pincodeBarView()
            productFilterBarView(filterProductCount: $filterProductCount)
            VStack(){
                ForEach(0..<5){product in
                    HStack{
                        HStack
                        {
                            ZStack{
                                
                                Image("test1").resizable()
                                    .frame(width: 120, height: 150, alignment: .leading).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                
                                Image("offers")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: 30, height: 30).padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 120))
                            }
                            VStack{
                                
                                Text("Product Information").bold().font(.system(size: 13)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10).multilineTextAlignment(.leading)
                                Text("₹\("55.00")").bold().font(.system(size: 15)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                                Text("You Save₹\("55.00")").bold().font(.system(size: 12)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.green).padding(.leading,10)
                                Text("₹\("Extra")").bold().font(.system(size: 12)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                                Image("brandtest")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Rectangle())
                                    .frame(maxWidth:.infinity,maxHeight:20,alignment: .leading).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                Button(action: {}, label: {
                                    Text("ADD     +").bold().font(.system(size: 10)).foregroundColor(.white).frame(width: 100,height:20,alignment:.center)
                                }).frame(width: 100,height:20,alignment:.leading).background(Color("blueTheme"))
                            }
                           
                        }
                       
                    }.background(Color.white)
                    Divider()
                }
            }
           
        }).background(Color.white.opacity(1.0)).frame(height:UIScreen.main.bounds.height).padding(.top,115)
        .edgesIgnoringSafeArea(.all)
           
        }
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView()
    }
}


struct productFilterBarView: View {
    @Binding var filterProductCount :Int
    var body: some View
    {
        HStack{
            Spacer(minLength: 0)
            Text("\(filterProductCount) products").foregroundColor(.black).font(.system(size: 12))
            Spacer(minLength: 0)
            Button(action: {}, label: {
                HStack{
                    Image(systemName: "macmini").foregroundColor(.white)
                    Text("Filter").bold().font(.system(size: 10)).foregroundColor(.white).frame(width: 100,height:20)
                }.frame(width: 100,height:20,alignment:.leading).background(Color.gray)
                
            }).frame(width: 100,height:20,alignment:.leading).background(Color.gray)
            Spacer(minLength: 0)
        }.frame(width: UIScreen.main.bounds.width, height: 30).background(Color("blueTheme"))
    }
}
