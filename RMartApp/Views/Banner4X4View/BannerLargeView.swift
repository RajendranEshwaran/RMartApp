//
//  BannerLargeView.swift
//  RMartApp
//
//  Created by RMart on 1/28/21.
//

import SwiftUI

struct BannerLargeView: View {
    @State private var timer = Timer.publish(every:3,on:.main,in:.common).autoconnect()
    @State private var currentIndex = 0
    @State private var numberofLargeBanners = 5
    var body: some View {
        VStack{
            //PampletView()
            TabView(selection:$currentIndex){ // Ad slide 1
            ForEach(0..<numberofLargeBanners){ index in
                Image("ad1")
                    .resizable()
                    .scaledToFill()
                    .tag(index)
                    .frame(height:200)
            }
        }.tabViewStyle(PageTabViewStyle()).frame(width: UIScreen.main.bounds.width, height: 50)
//        .onReceive(timer, perform: { _ in
//            withAnimation{
//            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
//                print(currentIndex)
//            }
//        })
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/4)
    }
}

struct BannerLargeView_Previews: PreviewProvider {
    static var previews: some View {
        BannerLargeView()
       
    }
}

struct PampletView:View {
    @State private var headerline = 0
    var body: some View
    {
        let layout = [GridItem(.adaptive(minimum: 160))]
        VStack{
            ZStack{
                ForEach(0..<PampletTitle.pamptitles.count){ item in
                    RoundedRectangle(cornerRadius: 20).fill(Color.white)
                                //.stroke(lineWidth: 5)
                                .frame(width: 300, height: 70)
                                .foregroundColor(.purple)
                        
                    Text("\(PampletTitle.pamptitles[item].title ?? "")").bold().foregroundColor(.black).multilineTextAlignment(.center)
                }
                
            }
            LazyVGrid(columns:layout,spacing : 20)
            {
                ForEach(0..<ExclusiveDeals.exclusiveDeals.count-2){item in
                    ZStack{
                    Rectangle().fill(Color("blueTheme")).frame(width: 170, height: 150).clipShape(RoundedRectangle(cornerRadius: 10))

                        Image("test1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .padding(.bottom,50)
                            //.onTapGesture { self.gotoExclusiveDealsItemAt(item: item) }
                        VStack{
                            Spacer()
                            Text("\(ExclusiveDeals.exclusiveDeals[item].productName ?? "")").bold()
                            .font(.system(size: 12))
                            .frame(width: 170, height: 30, alignment: .center)
                                .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                        Text("UP TO 20% OFF").bold()
                            .font(.system(size: 15))
                            .frame(width: 170, height: 30, alignment: .center)
                            .background(Color.secondary)
                            .foregroundColor(Color.white)
                           
                        }
                            //.padding(.bottom,30)
//                        //Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-UIScreen.main.bounds.height/4).background(Color.random).opacity(0.6)
        .onAppear()
        {
            headerline = Int.random(in: 0...2)
        }
    }
    
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
