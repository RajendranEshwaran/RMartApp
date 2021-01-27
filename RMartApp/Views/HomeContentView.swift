//
//  HomeContentView.swift
//  RMart
//
//  Created by RMart on 12/23/20.
//

import SwiftUI

struct HomeContentView: View {
    
    @State private var numberofImages = 5
    @State private var numberofShopfromcategory = 6
    @State private var timer = Timer.publish(every:3,on:.main,in:.common).autoconnect()
    @State private var currentIndex = 0
    @State private var shopCatIndex = 1
    @State private var pincode:String = "19355"
    @EnvironmentObject var setting : Settings
    @State private var categoryType:Int = 0
    var body: some View {
        let layout = [GridItem(.adaptive(minimum: 120))]
        VStack{
            //Mark:- Header panel and searchbar
            HeaderSearchView()
            Spacer(minLength:0)
            ScrollView(.vertical, showsIndicators: false, content: {
                HStack{
                    // Any news advertisement.....
                   // Text("Ads Running. . . . . . ")
                }.frame(width: UIScreen.main.bounds.width, height: 30).background(Color("blueTheme"))
                Spacer(minLength: 0)
                // Category portion
                ScrollView(.horizontal,showsIndicators:false) {
                    HStack(spacing: 20) {
                        ForEach(0..<setting.categoryArray.count) { categoryItemIndex in
                            VStack{
                                ZStack{
                                    Spacer(minLength:0)
                                    Circle().fill(Color("blueTheme")).frame(width:80,height:80)
                                    Image(setting.categoryIconsArray[categoryItemIndex]).resizable().aspectRatio(contentMode: .fit).contentShape(Circle()).frame(width:40,height:40,alignment: .center).tag(categoryItemIndex)
                                        .onTapGesture { self.gotoCategoryView(index: categoryItemIndex) }
                                    Spacer(minLength:0)
                                }
                                Text("\(setting.categoryArray[categoryItemIndex])").foregroundColor(.black).font(.system(size: 12))
                            }
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
                /*.onReceive(timer, perform: { _ in
                    withAnimation{
                    currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
                        print(currentIndex)
                    }
                })*/
                }
                Spacer(minLength: 100)
                VStack()
                {
                    Text("\(DealsKeys.shopFromTopCategories.rawValue)").bold().foregroundColor(Color("blueTheme"))
                }.frame(width: UIScreen.main.bounds.width).background(Color.white)
                VStack{ // shop from catogories gird init
                    LazyVGrid(columns:layout,spacing : 20)
                    {
                        ForEach(0..<DemoDatas.topCategoryName.count){item in
                            //Text("\(item),\(DemoDatas.topCategoryName[item])")
                            ZStack{
                            Rectangle().fill(Color("blueTheme")).frame(width: 110, height: 120).clipShape(RoundedRectangle(cornerRadius: 10))
                            
                                Image(DemoDatas.topCategoryThumb[item])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 70)
                                    .clipShape(RoundedRectangle(cornerRadius: 5.0)).padding(.bottom,30)
                                    .onTapGesture
                                    {
                                        print(item)
                                    }
                                Spacer()
                                Text("\(DemoDatas.topCategoryName[item])").bold().padding(.top,60).font(.system(size: 12)).foregroundColor(.black)
                            }
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width).background(Color.white)
                VStack{ // Banner 1 view design
                    Image("banner1")// Banner 1
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                }.padding()
                TopDealsView()
            })
        }
    }
    func gotoCategoryView(index:Int)
    {
        print("category index \(index)")
    }
    func gotoProductCategoryView()
    {
        
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
    @EnvironmentObject var setting:Settings
    @ObservedObject var userVM = UserDataListViewModel()
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
//        .onReceive(timer, perform: { _ in
//            withAnimation{
//            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
//                print(currentIndex)
//            }
//        })
            
        }
        Spacer(minLength: 100)
        VStack()
        {
            HStack{
                Text("\(DealsKeys.topDeals.rawValue)").bold().foregroundColor(Color("blueTheme")).frame(maxWidth:.infinity,maxHeight:10,alignment: .leading).padding(.leading,20)
               
                Button(action: {
                    setting.showTopDealListView.toggle()
                }, label: {
                    Text("\(CommonKeys.viewAll)").bold().font(.system(size: 10)).foregroundColor(.red).frame(width: 100,height:20,alignment:.center)
                }).frame(width: 100,height:20,alignment:.leading).background(Color.white).padding(.leading,10)
            }
            TopDealsProductView()
        }
        
        VStack{ // Banner 1 view design
            Image("banner1")// Banner 1
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
        }
        
        ShopGroceryView()
        Spacer(minLength: 100)
        
        if(setting.showTopDealListView)
        {
            NavigationLink(
                destination: TopDealsAllProductView(),
                isActive: .constant(true),
                label: {
                })
        }
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
        let layout = [GridItem(.adaptive(minimum: 160))]
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
//        .onReceive(timer, perform: { _ in
//            withAnimation{
//            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
//                print(currentIndex)
//            }
//        })
        }
            Spacer(minLength: 100)
        VStack()
        {
            Text("\(DealsKeys.shopGroceries.rawValue)").bold().foregroundColor(Color("blueTheme"))
        }
            Spacer(minLength: 10)
        VStack{ // shop from catogories gird init
            LazyVGrid(columns:layout,spacing : 10)
            {
                ForEach(0..<DemoDatas.topCategoryName.count-3){item in
                    ZStack{
                    Rectangle().fill(Color("blueTheme")).frame(width: 170, height: 150).clipShape(RoundedRectangle(cornerRadius: 10))

                        Image("test2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 165, height: 165)
                            //.padding(.bottom,30)
//                        //Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
            }
        }
        VStack{ // Banner 1 view design
            Image("banner1")// Banner 1
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
        }
            TopDealsForYouView()
            Spacer(minLength: 100)
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
        let layout = [GridItem(.adaptive(minimum: 160))]
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
//        .onReceive(timer, perform: { _ in
//            withAnimation{
//            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
//                print(currentIndex)
//            }
//        })
        }
        
        Spacer(minLength: 100)
        VStack()
        {
            Text("\(DealsKeys.topDealsForYou.rawValue)").bold().foregroundColor(Color("blueTheme"))
        }
        VStack{ // shop from catogories gird init
           
            /*GridStack(rows: 4, columns: 2) { row, col in
                Image("test2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                
            }*/
            LazyVGrid(columns:layout,spacing : 10)
            {
                ForEach(0..<DemoDatas.topCategoryName.count-3){item in
                    ZStack{
                    Rectangle().fill(Color("blueTheme")).frame(width: 170, height: 150).clipShape(RoundedRectangle(cornerRadius: 10))

                        Image("test2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 165, height: 165)
                            //.padding(.bottom,30)
//                        //Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
            }
        }
        VStack{ // Banner 1 view design
            Image("banner1")// Banner 1
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
        }
            BestDealsForYouView()
            Spacer(minLength: 100)
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
        let layout = [GridItem(.adaptive(minimum: 160))]
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
//        .onReceive(timer, perform: { _ in
//            withAnimation{
//            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
//                print(currentIndex)
//            }
//        })
        }
        
        Spacer(minLength: 100)
        VStack()
        {
            Text("\(DealsKeys.bestDealsForYou.rawValue)").bold().foregroundColor(Color("blueTheme"))
        }
        VStack{ // shop from catogories gird init
//            Spacer(minLength: 50)
//            GridStack(rows: 4, columns: 2) { row, col in
//                Image("test2")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 175, height: 175)
//                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
//
//            }
            LazyVGrid(columns:layout,spacing : 10)
            {
                ForEach(0..<DemoDatas.topCategoryName.count-3){item in
                    ZStack{
                    Rectangle().fill(Color("blueTheme")).frame(width: 170, height: 150).clipShape(RoundedRectangle(cornerRadius: 10))

                        Image("test2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 165, height: 165)
                            //.padding(.bottom,30)
//                        //Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
            }
        }
        VStack{ // Banner 1 view design
            Image("banner1")// Banner 1
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
        }
            ExclusiveDealsForYouView()
            Spacer(minLength: 100)
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
        let layout = [GridItem(.adaptive(minimum: 160))]
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
//        .onReceive(timer, perform: { _ in
//            withAnimation{
//            currentIndex = currentIndex < numberofImages ? currentIndex + 1 : 0
//                print(currentIndex)
//            }
//        })
        }
        
        Spacer(minLength: 100)
        VStack()
        {
            Text("\(DealsKeys.exclusiveDealsForYou.rawValue)").bold().foregroundColor(Color("blueTheme"))
        }
        VStack{ // shop from catogories gird init
//            Spacer(minLength: 50)
//            GridStack(rows: 4, columns: 2) { row, col in
//                Image("test2")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 175, height: 175)
//                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
//
//            }
            LazyVGrid(columns:layout,spacing : 10)
            {
                ForEach(0..<DemoDatas.topCategoryName.count-3){item in
                    ZStack{
                    Rectangle().fill(Color("blueTheme")).frame(width: 170, height: 150).clipShape(RoundedRectangle(cornerRadius: 10))

                        Image("test2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 165, height: 165)
                            //.padding(.bottom,30)
//                        //Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
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
                Spacer(minLength: 0)
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        ZStack{
                            Rectangle().fill(Color("blueTheme")).frame(width: 100, height: 120).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal,10)
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


