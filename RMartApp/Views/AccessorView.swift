//
//  AccessorView.swift
//  RMart
//
//  Created by RMart on 12/24/20.
//

import SwiftUI

struct AccessorView: View {
    @ObservedObject var otpNumber = NumbersOnly()
    @State private var isOtp:Bool = true
    @ObservedObject var phoneNumber = NumbersOnly()
    @Environment(\.presentationMode) var presentation
    var body: some View {

        VStack{
            
            Text("Sign In").bold().padding(.trailing,300)
                .padding(.top,100)
            Text("SignIn to access your Orders, Offers and Wishlist")
                .padding().padding(.trailing,10)
            
            TextField("Enter Phone Number",
                text: $phoneNumber.value,
                        onEditingChanged: { _ in print("changed") },
                        onCommit: { print("commit") }
                    ).frame(width:UIScreen.main.bounds.width - 50,height: 80)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            if(isOtp)
            {
            TextField("Enter six digit OTP",
                        text: $otpNumber.value,
                        onEditingChanged: { _ in print("changed") },
                        onCommit: { print("commit") }
                    ).frame(width:UIScreen.main.bounds.width - 50,height: 80)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                
                HStack{
                    Text("Waiting for OTP /() seconds")
                    Button(action: {}, label: {
                       
                        Text("Resend OTP").foregroundColor(Color.red).bold().padding()
                    })
                }
            }
            ZStack{
                
                if(!isOtp)
                {
                Button(action: {}, label: {
                    Text(">")
                        .font(.system(size: 55))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .background(Color("blueTheme"))
                        .cornerRadius(50)
                })
                }
                else
                {
                    
                    Button(action: {
                        otpVerification()
                    }, label: {
                        Text("Verify").foregroundColor(.white).bold().frame(width: 200, height: 50)
                    })
                    .background(Color("blueTheme"))
                    Spacer(minLength: 50)
                }

            }
            
            Spacer(minLength: 200)
        }.navigationBarTitle("",displayMode: .inline)
        .navigationBarItems(leading: HStack{
            Spacer(minLength: 100)
            Text("Sign In / Sign Up").bold().foregroundColor(.white)
             }).foregroundColor(.black)

        
    }
    
    func otpVerification()
    {
        print("otp verification processing")
        self.presentation.wrappedValue.dismiss()
    }
}

struct AccessorView_Previews: PreviewProvider {
    static var previews: some View {
        AccessorView()
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

