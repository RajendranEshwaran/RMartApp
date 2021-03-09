//
//  FashionGalleryView.swift
//  RMartApp
//
//  Created by gomathi saminathan on 2/2/21.
//

import SwiftUI


struct FashionGalleryView:View {
    @State private var headerline = 0
    var body: some View
    {
        let layout = [GridItem(.adaptive(minimum: 100))]
        VStack{
          
            
            LazyVGrid(columns:layout,spacing : 20)
            {
                ForEach(0..<9){item in
                    ZStack{
                        Rectangle().fill(Color.random).frame(width: 100, height: 120).clipShape(RoundedRectangle(cornerRadius: 5)).border(Color.black, width: 0)

                        /*Image("test1")
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
                           
                        }*/
                            //.padding(.bottom,30)
//                        //Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
            }
            Spacer(minLength: 10)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-420).background(Color.white).opacity(0.6)
        .onAppear()
        {
            headerline = Int.random(in: 0...2)
        }
    }
    
}

struct FashionGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        FashionGalleryView()
    }
}


struct KidsFashionView:View {
    @State private var headerline = 0
    var body: some View
    {
        let layout = [GridItem(.adaptive(minimum: 100))]
        VStack{
          
            
            LazyVGrid(columns:layout,spacing : 20)
            {
                ForEach(0..<9){item in
                    ZStack{
                        Rectangle().fill(Color.random).frame(width: 100, height: 120).clipShape(RoundedRectangle(cornerRadius: 5)).border(Color.black, width: 0)

                        /*Image("test1")
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
                           
                        }*/
                            //.padding(.bottom,30)
//                        //Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
            }
            Spacer(minLength: 10)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-420).background(Color.white).opacity(0.6)
        .onAppear()
        {
            headerline = Int.random(in: 0...2)
        }
    }
    
}


struct WomensFashionView:View {
    @State private var headerline = 0
    var body: some View
    {
        let layout = [GridItem(.adaptive(minimum: 100))]
        VStack{
          
            
            LazyVGrid(columns:layout,spacing : 20)
            {
                ForEach(0..<9){item in
                    ZStack{
                        Rectangle().fill(Color.random).frame(width: 100, height: 120).clipShape(RoundedRectangle(cornerRadius: 5)).border(Color.black, width: 0)

                        /*Image("test1")
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
                           
                        }*/
                            //.padding(.bottom,30)
//                        //Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
            }
            Spacer(minLength: 10)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-420).background(Color.white).opacity(0.6)
        .onAppear()
        {
            headerline = Int.random(in: 0...2)
        }
    }
    
}


struct MensFashionView:View {
    @State private var headerline = 0
    var body: some View
    {
        let layout = [GridItem(.adaptive(minimum: 160))]
        VStack{
          
            
            LazyVGrid(columns:layout,spacing : 20)
            {
                ForEach(0..<9){item in
                    ZStack{
                        Rectangle().fill(Color.random).frame(width: 150, height: 150).clipShape(RoundedRectangle(cornerRadius: 5)).border(Color.black, width: 0)

                        /*Image("test1")
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
                           
                        }*/
                            //.padding(.bottom,30)
//                        //Text("\(item),\(DemoDatas.topCategoryName[item])").padding(.top,60).font(.system(size: 12))
                    }
                }
            }
            Spacer(minLength: 10)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-420).background(Color.white).opacity(0.6)
        .onAppear()
        {
            headerline = Int.random(in: 0...2)
        }
    }
    
}
