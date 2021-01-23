//
//  ShopCategoryView.swift
//  RMartApp
//
//  Created by RMart on 1/4/21.
//

import SwiftUI

struct ShopCategoryView: View {
    var body: some View {
            VStack
            {
           // HeaderSearchDummyView()
           //     Spacer(minLength:0)
            ScrollView(.vertical, showsIndicators: false, content: {
            //Mark:- Header panel and searchbar
            pincodeBarView()
                Spacer(minLength:0)
            VStack{
                List(sampleMenuItems, children: \.subMenuItems) { item in
                    HStack {
                        Image(systemName: "pencil.tip.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                 
                        Text(item.name)
                            //.font(.system(.title3, design: .rounded))
                            .bold()
                            
                    }
                   
                }.frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height).listStyle(GroupedListStyle())
            }
        }).frame(height:UIScreen.main.bounds.height).background(Color.gray.opacity(0.2)).padding(.top,115)
                Spacer(minLength:0)
                    .edgesIgnoringSafeArea(.all)
            }
        
    }
}

struct ShopCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ShopCategoryView()
    }
}

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var subMenuItems: [MenuItem]?
}

// Main menu items
let sampleMenuItems = [ MenuItem(name: "Groceries", image: "pencil.tip.crop.circle", subMenuItems: espressoMachineMenuItems),
                        MenuItem(name: "Fashion", image: "pencil.tip.crop.circle", subMenuItems: grinderMenuItems),
                        MenuItem(name: "Other Equipment", image: "espresso-ep", subMenuItems: otherMenuItems)
                    ]


// Sub-menu items for Espressco Machines
let espressoMachineMenuItems = [ MenuItem(name: "Leva", image: "leva-x", subMenuItems: [ MenuItem(name: "Leva X", image: "leva-x"), MenuItem(name: "Leva S", image: "leva-s") ]),
                                 MenuItem(name: "Strada", image: "strada-ep", subMenuItems: [ MenuItem(name: "Strada EP", image: "strada-ep"), MenuItem(name: "Strada AV", image: "strada-av"), MenuItem(name: "Strada MP", image: "strada-mp"), MenuItem(name: "Strada EE", image: "strada-ee") ]),
                                 MenuItem(name: "KB90", image: "kb90"),
                                 MenuItem(name: "Linea", image: "linea-pb-x", subMenuItems: [ MenuItem(name: "Linea PB X", image: "linea-pb-x"), MenuItem(name: "Linea PB", image: "linea-pb"), MenuItem(name: "Linea Classic", image: "linea-classic") ]),
                                 MenuItem(name: "GB5", image: "gb5"),
                                 MenuItem(name: "Home", image: "gs3", subMenuItems: [ MenuItem(name: "GS3", image: "gs3"), MenuItem(name: "Linea Mini", image: "linea-mini") ])
                                ]
 
// Sub-menu items for Grinder
let grinderMenuItems = [ MenuItem(name: "Swift", image: "swift"),
                         MenuItem(name: "Vulcano", image: "vulcano"),
                         MenuItem(name: "Swift Mini", image: "swift-mini"),
                         MenuItem(name: "Lux D", image: "lux-d")
                        ]
 
// Sub-menu items for other equipment
let otherMenuItems = [ MenuItem(name: "Espresso AV", image: "espresso-av"),
                         MenuItem(name: "Espresso EP", image: "espresso-ep"),
                         MenuItem(name: "Pour Over", image: "pourover"),
                         MenuItem(name: "Steam", image: "steam")
                        ]
