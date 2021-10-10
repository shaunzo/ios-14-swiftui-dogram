//
//  SettingsRowView.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/10/10.
//

import SwiftUI

struct SettingsRowView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.blue)
                Image(systemName: "heart.fill")
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            Text("Row title")
            Spacer()
            Image(systemName: "chevron.right")
                .font(.headline)
        }
        .padding(.vertical, 4)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView()
            .previewLayout(.sizeThatFits)
    }
}
