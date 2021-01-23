//
//  ProductCategoryView.swift
//  RMartApp
//
//  Created by RMart on 1/19/21.
//

import SwiftUI

struct ProductCategoryView: View {
    @Binding var categoryType:Int
    var body: some View {
        VStack{
            
        ScrollView(.vertical, showsIndicators: false, content: {
            pincodeBarView()
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack
                {
                    ForEach(0..<20){product in
                        Button(action: {}, label: {
                        Text("Milk")
                        }).background(Color.gray).foregroundColor(.white)
                    }
                }
            }).frame(width:UIScreen.main.bounds.width,height:25).background(Color.white)
            
            ScrollView(.horizontal, showsIndicators: false, content:
            {
              
                    VStack(){
                        ForEach(0..<5){product in
                            VStack{
                                HStack{
                                    ZStack{
                                        Image("test1").resizable()
                                            .frame(width: 120, height: 150, alignment: .leading).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
                                        Image("offers")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .clipShape(Circle())
                                            .frame(width: 30, height: 30, alignment: .leading)
                                                            .padding(EdgeInsets(top: 0, leading: 50, bottom: 100, trailing: 0))
                                    }
                                    
                                    VStack(alignment:.leading){
                                        HStack{
                                            Text("₹\("55.00")").bold().font(.system(size: 15)).foregroundColor(.black).padding(.leading,10)
                                            Text("₹\("400.00")").strikethrough() .font(.system(size: 10)).foregroundColor(.black).padding(.leading,10)
                                        }
                                        Text("Save as ₹\("55.00")").bold().font(.system(size: 12)).foregroundColor(.green).padding(.leading,10)
                                        Text("Good light Almonds 500g").bold().font(.system(size: 10)).foregroundColor(.black).padding(.leading,10)
                                        Button(action: {}, label: {
                                            Text("ADD     +").bold().font(.system(size: 10)).foregroundColor(.white).frame(width: 140,height:20,alignment:.center)
                                        }).frame(width: 100,height:20,alignment:.leading).background(Color("blueTheme")).padding().padding(.trailing,20)
                                    }
                                }.frame(width:UIScreen.main.bounds.width)
                            }
                            Divider()
                        }
                        
                    }.background(Color.white)
                
            })//.frame(height:400)
            
        }).background(Color.gray.opacity(0.2)).frame(height:UIScreen.main.bounds.height).padding(.top,115)
        .edgesIgnoringSafeArea(.all)
           
        }.onAppear()
        {
            fetchProductByCategory()
        }
    }
    func fetchProductByCategory()
    {
        switch categoryType {
        case 1: break
            //
        default:
            break
        }
    }
}

struct ProductCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCategoryView(categoryType: .constant(0))
    }
}
