//
//  HomeContentView.swift
//  RMart
//
//  Created by RMart on 12/23/20.
//

import SwiftUI

struct HomeContentView: View {
    @State private var pincode:String = "19355"
    @State private var numberofImages = 5
    @State private var numberofShopfromcategory = 6
    @State private var timer = Timer.publish(every:3,on:.main,in:.common).autoconnect()
    @State private var currentIndex = 0
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false, content: {
                HStack{
                    Label("Deliver to \(pincode)", systemImage: "mappin").frame(width:UIScreen.main.bounds.width,height: 50).background(Color("blueThemeLight")).foregroundColor(.white).font(.title3)
                }
                Spacer(minLength: 5)
                // Category portion
                ScrollView(.horizontal,showsIndicators:false) {
                    HStack(spacing: 20) {
                        ForEach(0..<10) { index in
                            
                            Circle().fill(Color("blueTheme")).frame(width:100,height:100)
                        }
                        
                    }.padding()
                }.frame(height: 100)
                Spacer(minLength: 100)
                VStack{
                    TabView(selection:$currentIndex){ // Ad slide 1
                    ForEach(0..<numberofImages){ index in
                        Image("ad1")
                            .resizable()
                            .scaledToFill()
                            .tag(index)
                            .frame(height:200)
                    }
                }.tabViewStyle(PageTabViewStyle()).frame(width: UIScreen.main.bounds.width, height: 50)
                .onReceive(timer, perform: { _ in
                    withAnimation{
                    currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
                        print(currentIndex)
                    }
                })
                }
                Spacer(minLength: 100)
                VStack()
                {
                    Text("\(DealsKeys.shopFromTopCategories.rawValue)").bold().foregroundColor(Color("blueTheme"))
                }
                VStack{ // shop from catogories gird init
                    Spacer(minLength: 50)
                    GridStack(rows: 4, columns: 2) { row, col in
                        Image("test2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 175, height: 175)
                            .clipShape(RoundedRectangle(cornerRadius: 5.0))
                        
                    }
                }
                VStack{ // Banner 1 view design
                    Image("banner1")// Banner 1
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                }
                
                TopDealsView()
                
            })
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}

//MARK:- TOP DEALS VIEW
struct TopDealsView: View{
    @State private var numberofImages = 5
    @State private var numberofShopfromcategory = 6
    @State private var timer = Timer.publish(every:3,on:.main,in:.common).autoconnect()
    @State private var currentIndex = 0
    var body: some View
    {
        Spacer(minLength: 100)
        VStack{
            TabView(selection:$currentIndex){ // Ad slide 1
            ForEach(0..<numberofImages){ index in
                Image("ad1")
                    .resizable()
                    .scaledToFill()
                    .tag(index)
                    .frame(height:200)
            }
        }.tabViewStyle(PageTabViewStyle()).frame(width: UIScreen.main.bounds.width, height: 50)
        .onReceive(timer, perform: { _ in
            withAnimation{
            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
                print(currentIndex)
            }
        })
        }
        
        Spacer(minLength: 100)
        VStack()
        {
            Text("\(DealsKeys.topDeals.rawValue)").bold().foregroundColor(Color("blueTheme"))
        }
        VStack{ // shop from catogories gird init
            Spacer(minLength: 50)
            GridStack(rows: 4, columns: 2) { row, col in
                Image("test2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                
            }
        }
        VStack{ // Banner 1 view design
            Image("banner1")// Banner 1
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
        }
        ShopGroceryView()
    }
}

//MARK:- SHOP GROCERIES VIEW
struct ShopGroceryView: View{
    @State private var numberofImages = 5
    @State private var numberofShopfromcategory = 6
    @State private var timer = Timer.publish(every:3,on:.main,in:.common).autoconnect()
    @State private var currentIndex = 0
    var body: some View
    {
        VStack{
        Spacer(minLength: 100)
        VStack{
            TabView(selection:$currentIndex){ // Ad slide 1
            ForEach(0..<numberofImages){ index in
                Image("ad1")
                    .resizable()
                    .scaledToFill()
                    .tag(index)
                    .frame(height:200)
            }
        }.tabViewStyle(PageTabViewStyle()).frame(width: UIScreen.main.bounds.width, height: 50)
        .onReceive(timer, perform: { _ in
            withAnimation{
            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
                print(currentIndex)
            }
        })
        }
        
        Spacer(minLength: 100)
        VStack()
        {
            Text("\(DealsKeys.shopGroceries.rawValue)").bold().foregroundColor(Color("blueTheme"))
        }
        VStack{ // shop from catogories gird init
            Spacer(minLength: 50)
            GridStack(rows: 4, columns: 2) { row, col in
                Image("test2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                
            }
        }
        VStack{ // Banner 1 view design
            Image("banner1")// Banner 1
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
        }
            TopDealsForYouView()
        }
    }
}

//MARK:- TOP DEALS FOR YOU VIEW
struct TopDealsForYouView: View{
    @State private var numberofImages = 5
    @State private var numberofShopfromcategory = 6
    @State private var timer = Timer.publish(every:3,on:.main,in:.common).autoconnect()
    @State private var currentIndex = 0
    var body: some View
    {
        VStack{
        Spacer(minLength: 100)
        VStack{
            TabView(selection:$currentIndex){ // Ad slide 1
            ForEach(0..<numberofImages){ index in
                Image("ad1")
                    .resizable()
                    .scaledToFill()
                    .tag(index)
                    .frame(height:200)
            }
        }.tabViewStyle(PageTabViewStyle()).frame(width: UIScreen.main.bounds.width, height: 50)
        .onReceive(timer, perform: { _ in
            withAnimation{
            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
                print(currentIndex)
            }
        })
        }
        
        Spacer(minLength: 100)
        VStack()
        {
            Text("\(DealsKeys.topDealsForYou.rawValue)").bold().foregroundColor(Color("blueTheme"))
        }
        VStack{ // shop from catogories gird init
            Spacer(minLength: 50)
            GridStack(rows: 4, columns: 2) { row, col in
                Image("test2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                
            }
        }
        VStack{ // Banner 1 view design
            Image("banner1")// Banner 1
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
        }
            BestDealsForYouView()
        }
    }
}

//MARK:- BEST DEALS FOR YOU VIEW
struct BestDealsForYouView: View{
    @State private var numberofImages = 5
    @State private var numberofShopfromcategory = 6
    @State private var timer = Timer.publish(every:3,on:.main,in:.common).autoconnect()
    @State private var currentIndex = 0
    var body: some View
    {
        VStack{
        Spacer(minLength: 100)
        VStack{
            TabView(selection:$currentIndex){ // Ad slide 1
            ForEach(0..<numberofImages){ index in
                Image("ad1")
                    .resizable()
                    .scaledToFill()
                    .tag(index)
                    .frame(height:200)
            }
        }.tabViewStyle(PageTabViewStyle()).frame(width: UIScreen.main.bounds.width, height: 50)
        .onReceive(timer, perform: { _ in
            withAnimation{
            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
                print(currentIndex)
            }
        })
        }
        
        Spacer(minLength: 100)
        VStack()
        {
            Text("\(DealsKeys.bestDealsForYou.rawValue)").bold().foregroundColor(Color("blueTheme"))
        }
        VStack{ // shop from catogories gird init
            Spacer(minLength: 50)
            GridStack(rows: 4, columns: 2) { row, col in
                Image("test2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                
            }
        }
        VStack{ // Banner 1 view design
            Image("banner1")// Banner 1
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
        }
            ExclusiveDealsForYouView()
        }
    }
}

//MARK:- EXCLUSIVE DEALS FOR YOU VIEW
struct ExclusiveDealsForYouView: View{
    @State private var numberofImages = 5
    @State private var numberofShopfromcategory = 6
    @State private var timer = Timer.publish(every:3,on:.main,in:.common).autoconnect()
    @State private var currentIndex = 0
    var body: some View
    {
        Spacer(minLength: 100)
        VStack{
            TabView(selection:$currentIndex){ // Ad slide 1
            ForEach(0..<numberofImages){ index in
                Image("ad1")
                    .resizable()
                    .scaledToFill()
                    .tag(index)
                    .frame(height:200)
            }
        }.tabViewStyle(PageTabViewStyle()).frame(width: UIScreen.main.bounds.width, height: 50)
        .onReceive(timer, perform: { _ in
            withAnimation{
            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
                print(currentIndex)
            }
        })
        }
        
        Spacer(minLength: 100)
        VStack()
        {
            Text("\(DealsKeys.exclusiveDealsForYou.rawValue)").bold().foregroundColor(Color("blueTheme"))
        }
        VStack{ // shop from catogories gird init
            Spacer(minLength: 50)
            GridStack(rows: 4, columns: 2) { row, col in
                Image("test2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                
            }
        }
        VStack{ // Banner 1 view design
            Image("banner1")// Banner 1
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
            
        }
        
    }
}
//MARK:-    GRID PANEL CREATE ROW & COLOMN
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
           
            ForEach(0 ..< rows, id: \.self) { row in
                Spacer(minLength: -60)
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        ZStack{
                            Rectangle().fill(Color("blueTheme")).frame(width: 170, height: 110).clipShape(RoundedRectangle(cornerRadius: 10))
                            self.content(row, column)
                        }
                        
                    }
                }
                
            }
           
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}
