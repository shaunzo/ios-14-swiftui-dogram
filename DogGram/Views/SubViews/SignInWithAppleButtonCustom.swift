//
//  SignInWithAppleButtonCustom.swift
//  DogGram
//
//  Created by shaun reddiar on 2021/10/22.
//

import Foundation
import SwiftUI
import AuthenticationServices

// UIViewRespresentable is used to convert things from UIKit to SwiftUI

struct SignInWithAppleButtonCustom: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
    
}
