//
//  SignInView.swift
//  RMart
//
//  Created by RMart on 12/24/20.
//

import SwiftUI
import PhoneNumberKit

struct SignInView: View {
    @ObservedObject var otpNumber = NumbersOnly()
    @State private var isOtp:Bool = false
    @ObservedObject var phoneNumbers = NumbersOnly()
    @Environment(\.presentationMode) var presentation
    @State private var phoneNumber = String()
    @State private var validationError = false
    @State private var errorDesc = Text("")
    @State private var phoneField: PhoneNumberTextFieldView?
    @EnvironmentObject var setting: Settings
    let phoneNumberKit = PhoneNumberKit()
    var body: some View {

        VStack{
            
            Text("Sign In").bold().padding(.trailing,300)
                .padding(.top,100)
            Text("SignIn to access your Orders, Offers and Wishlist")
                .padding().padding(.trailing,10)
            
//            TextField("Enter Phone Number",
//                text: $phoneNumbers.value,
//                        onEditingChanged: { _ in print("changed") },
//                        onCommit: {
//
//                            print("commit") }
//                    ).frame(width:UIScreen.main.bounds.width - 50,height: 80)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .keyboardType(.decimalPad)
            
            self.phoneField
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                                .keyboardType(.phonePad)
            if(isOtp)
            {
            TextField("Enter six digit OTP",
                        text: $otpNumber.value,
                        onEditingChanged: { _ in print("changed") },
                        onCommit: { print("commit")
                            
                        }
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
                    Button(action: {
                        do {
                            self.phoneField?.getCurrentText()
                            print("phone is: \(self.phoneNumber)")
                            let validatedPhoneNumber = try self.phoneNumberKit.parse(self.phoneNumber)
                            print("Validated Number: \(validatedPhoneNumber)")
                            // Integrate with your login/registration system here...
                            isOtp = true
                        }
                        catch {
                            self.validationError = true
                            self.errorDesc = Text("Please enter a valid phone number")
                        }
                    }, label: {
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
            .onAppear {
                            self.phoneField = PhoneNumberTextFieldView(phoneNumber: self.$phoneNumber)
                        }
                        .alert(isPresented: self.$validationError) {
                            Alert(title: Text(""), message: self.errorDesc, dismissButton: .default(Text("OK")))
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
        if(otpNumber.value == "2")
        {
            setting.showSign = false
            setting.isSigned.toggle()
            presentation.wrappedValue.dismiss()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
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

struct PhoneNumberTextFieldView: UIViewRepresentable {
    @Binding var phoneNumber: String
    private let textField = PhoneNumberTextField()
 
    func makeUIView(context: Context) -> PhoneNumberTextField {
        textField.withExamplePlaceholder = true
        //textField.font = UIFont(name: GlobalConstant.paragraphFont.rawValue, size: 17)
        textField.withFlag = true
        textField.withPrefix = true
        // textField.placeholder = "Enter phone number"
        textField.becomeFirstResponder()
        return textField
    }

    func getCurrentText() {
        self.phoneNumber = textField.text!
    }
    
    func updateUIView(_ view: PhoneNumberTextField, context: Context) {
  
    }
    
}
