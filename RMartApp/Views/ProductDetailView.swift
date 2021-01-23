//
//  ProductDetailView.swift
//  RMartApp
//
//  Created by RMart on 1/9/21.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var setting:Settings
    @Environment(\.presentationMode) var presentationMode
    @State private var pincode:String = "19355"
    init() {
       }
    var body: some View {
       
            VStack{
                
            ScrollView(.vertical, showsIndicators: false, content: {
                pincodeBarView()
                VStack(alignment:.leading,spacing:10){
                    Text("Product Title").font(.headline).frame(maxWidth:.infinity,alignment: .leading).padding(.leading,10)
                    Text("Sub Title").font(.subheadline).padding(.leading,10)
                HStack {
                    Image("offers")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .leading).padding(.bottom,120).padding(.leading,10)
                    Spacer()
                    Image( "test1")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding(.leading, -50)
                    Spacer()
                }
                    Text("You save ₹\(55.00)").bold().font(.system(size: 12)).foregroundColor(.green).padding(.leading,10)
                    HStack{
                        Text("₹\(55.00)").bold().font(.system(size: 15)).foregroundColor(.black).padding(.leading,10)
                        Text("₹\(100.00)").strikethrough().font(.system(size: 10)).foregroundColor(.gray)
                        Text("(Include of all taxes)").font(.system(size: 10)).foregroundColor(.gray)
                    }
                    Text("If any other offers").bold().font(.system(size: 12)).foregroundColor(.black).padding(.leading,10)
                    Text("If any other offers").bold().font(.system(size: 12)).foregroundColor(.black).padding(.leading,10)
                }.background(Color.white)
                Spacer()
                Group{
                VStack(alignment:.leading,spacing:10){
                    Text("In Stock").bold().font(.system(size: 12)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.green).padding(.leading,10)
                    
                    Text("Sold By RMart").bold().font(.system(size: 10)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                    
                    Text("Delivery").bold().font(.system(size: 14)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                    
                    HStack {
                        Image( "map2").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20)
                      TextField("Enter your firstName", text: $pincode)
                        Button(action: {}, label: {
                            Text("check").foregroundColor(.red)
                        })
                      }
                    Divider()
                    Text("Check for the estimated delivery date").font(.system(size: 12)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.gray).padding(.leading,10)
                }.background(Color.white)
                Spacer()
                VStack{
                    Text("Offers").bold().font(.system(size: 15)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                    
                    ForEach(0..<2){id in
                        HStack{
                            Image("offersgreen").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20,alignment: .leading).padding(.leading,10)
                            Spacer()
                            Text("Mobiwik offers details & Terms and conditions").bold().font(.system(size: 12)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                        }
                    }
                }.background(Color.white)
                Spacer()
                VStack{
                    Text("Description").bold().font(.system(size: 13)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                    
                    Text("Perhaps the default font doesn’t fit your design requirements. Fret not. You can customize it to fit your design requirements and impress your designer team. The following code uses title as the font.Perhaps the default font doesn’t fit your design requirements. Fret not. You can customize it to fit your design requirements and impress your designer team. The following code uses title as the font.Perhaps the default font doesn’t fit your design requirements. Fret not. You can customize it to fit your design requirements and impress your designer team. The following code uses title as the font.").font(.system(size: 11)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                }.background(Color.white)
                
                Spacer()
                VStack{
                    Text("Features & Details").bold().font(.system(size: 13)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                    ForEach(0..<2){id in
                        HStack{
                            Text(".").bold().font(.system(size: 20)).frame(maxWidth:5,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                            Spacer()
                            Text("Mobiwik offers details & Terms and conditions").bold().font(.system(size: 10)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                        }
                    }
                }.background(Color.white)
               
                Spacer()
                    Group{
                    VStack{
                        Text("Product Information").bold().font(.system(size: 13)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                    }.background(Color.white)
                    
                    Spacer()
                        VStack{
                            Text("Disclaimer").bold().font(.system(size: 13)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                        }.background(Color.white)
                        
                        Spacer()
                            VStack{
                                Text("Dont Forget to Add").bold().font(.system(size: 13)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                                ScrollView(.horizontal, showsIndicators: false, content:
                                {
                                  
                                        HStack(){
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
                                                        }).frame(width: 140,height:20,alignment:.leading).background(Color("blueTheme")).padding().padding(.trailing,30)
                                                    }
                                                }
                                            
                                                
                                            }
                                            
                                        }
                                })//.frame(height:400)
                               
                            }.background(Color.white)
                        
                        Spacer()
                            VStack{
                                Text("You May Also like").bold().font(.system(size: 13)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                                
                                ScrollView(.horizontal, showsIndicators: false, content:
                                {
                                  
                                        HStack(){
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
                                                        }).frame(width: 140,height:20,alignment:.leading).background(Color("blueTheme")).padding().padding(.trailing,30)
                                                    }
                                                }
                                            
                                                
                                            }
                                            
                                        }
                                })//.frame(height:400)
                            }.background(Color.white)
                        
                        Spacer()
                            VStack{
                                Text("Product Rating").bold().font(.system(size: 13)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10)
                                HStack{
                                    Text("Rate Product").bold().font(.system(size: 10)).frame(maxWidth:.infinity,alignment: .leading).foregroundColor(.black).padding(.leading,10).padding(.bottom,10)
                                }
                                Button(action: {}, label: {
                                    Text("Write Review").frame(width: UIScreen.main.bounds.width - 50, height: 30).foregroundColor(.white)
                                }).background(Color.gray).opacity(0.5)
                                Divider()
                                Text("@ All rights are reserved by RMart").font(.system(size: 13)).frame(maxWidth:.infinity,maxHeight:30,alignment: .center).foregroundColor(.black).background(Color.gray).opacity(0.5)
                                Spacer()
                            }.background(Color.white)
                    }
            }
               
            }).background(Color.gray.opacity(0.2)).frame(height:UIScreen.main.bounds.height).padding(.top,115)
            .edgesIgnoringSafeArea(.all)
               
            }
       
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
