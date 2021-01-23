//
//  TopDealsView.swift
//  RMartApp
//
//  Created by RMart on 1/19/21.
//

import SwiftUI

struct TopDealsProductView: View {
    @EnvironmentObject var setting:Settings
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(){
                    ForEach(0..<TopDeals.topDeals.count){product in
                        Spacer()
                        VStack{
                            HStack{
                                ZStack{
                                    Image("test1").resizable()
                                        .frame(width: 120, height: 150, alignment: .leading).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 100))
                                    Image("offers")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                        .frame(width: 30, height: 30, alignment: .leading)
                                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 100, trailing: 0))
                                }
                            }
                            Spacer()
                            VStack(alignment:.leading,spacing:10){
                                HStack{
                                    Text("₹\(TopDeals.topDeals[product].productCPrice ?? "")").bold().font(.system(size: 15)).foregroundColor(.black).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                                    Text("₹\(TopDeals.topDeals[product].productAPrice ?? "")").strikethrough() .font(.system(size: 10)).foregroundColor(.black).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                                }
                                Text("Save as ₹\(TopDeals.topDeals[product].productSPrice ?? "")").bold().font(.system(size: 12)).foregroundColor(.green).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                                Text("\(TopDeals.topDeals[product].productName ?? "")").bold().font(.system(size: 10)).foregroundColor(.black).frame(maxWidth:.infinity,maxHeight:30,alignment: .leading).padding(.leading,10).multilineTextAlignment(.leading)
                                Button(action: {
                                    setting.selectedProductCount = setting.selectedProductCount + 1
                                    print("\(setting.selectedProductCount)")
                                }, label: {
                                    Text("ADD     +").bold().font(.system(size: 10)).foregroundColor(.white).frame(width: 140,height:20,alignment:.center)
                                }).frame(width: 100,height:20,alignment:.leading).background(Color("blueTheme")).padding(.leading,10)
                            }
                            Spacer()
                        }.frame(width:180,height: 300)
                    }
                    
                }.background(Color.white)
                
            }).background(Color.gray.opacity(0.2)).frame(height:UIScreen.main.bounds.height)
            .edgesIgnoringSafeArea(.all).frame(height:300)
            
        }
    }
}

struct TopDealsProductView_Previews: PreviewProvider {
    static var previews: some View {
        TopDealsProductView()
    }
}
