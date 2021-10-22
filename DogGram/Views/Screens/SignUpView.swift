//
//  SignUpView.swift
//  DogGram
//
//  Created by shaun reddiar on 2021/10/21.
//

import SwiftUI

struct SignUpView: View {
    
    @State var showOnBoardng: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Spacer();
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            
            Text("You are not signed in!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("Click the button below to create an account and join the fun!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Button(
                action: {
                    showOnBoardng.toggle()
                },
                label: {
                    Text("Sign in/Sign up".uppercased())
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.MyTheme.purpleColor)
                        .foregroundColor(Color.MyTheme.yellowColor)
                        .cornerRadius(12)
                        .shadow(radius: 12)
                })
            
            Spacer();
            Spacer();
            
        })
        
            .padding(.all, 40)
            .background(Color.MyTheme.yellowColor)
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(
                isPresented: $showOnBoardng,
                content: {
                    OnboardingView()
                })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
