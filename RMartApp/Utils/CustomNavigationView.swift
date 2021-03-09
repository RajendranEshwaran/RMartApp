//
//  CustomNavigationView.swift
//  RMartApp
//
//  Created by RMart on 3/3/21.
//

import SwiftUI


struct CustomNavigationView<Content: View, Destination : View>: View {
    let destination : Destination
    let isRoot : Bool
    let isLast : Bool
    let color : Color
    let content: Content
    @State var active = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(destination: Destination, isRoot : Bool, isLast : Bool,color : Color, @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.isRoot = isRoot
        self.isLast = isLast
        self.color = color
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                Color.white
                VStack {
                    ZStack {

                        Rectangle().fill(color.opacity(0.3)).overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 3).opacity(0.3)
                        )
                            .frame(width: geometry.size.width, height: 120)
                        HStack {
                            Image(systemName: "arrow.left").foregroundColor(.white)
                                    .frame(width: 30)
                                .onTapGesture(count: 1, perform: {
                                    self.mode.wrappedValue.dismiss()
                                }).opacity(isRoot ? 0 : 1)
                            Spacer()
                            //Image(systemName: "command").foregroundColor(.yellow)
                                Text("RMart").foregroundColor(.green)
                                .frame(width: 150)
                            Spacer()
                            Image(systemName: "arrow.right").foregroundColor(.white)
                                .frame(width: 30)
                                .onTapGesture(count: 1, perform: {
                                    self.active.toggle()
                                })
                                .opacity(isLast ? 0 : 1)
                            NavigationLink(
                                destination: destination.navigationBarHidden(true)
                                    .navigationBarHidden(true),
                                isActive: self.$active,
                                label: {
                                    //no label
                                })
                        }
                        .padding([.leading,.trailing], 8)
                        .frame(width: geometry.size.width)
                        .font(.system(size: 22))

                    }
                    .frame(width: geometry.size.width, height: 90)
                    .edgesIgnoringSafeArea(.top)

                    Spacer()
                    self.content
                        .padding()
                        .background(color.opacity(0.3))
                        .cornerRadius(20)
                    Spacer()
                }
            }.navigationBarHidden(true)
        }
    }
}
