//
//  ResultView.swift
//  Gacha
//
//  Created by Kiyoshi Ohashi on 2025/06/28.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    @State var backGroundImageName: String = "bgRed"
    @State var characterImageName: String = "iphone"
    @State var star: String = "⭐️⭐️"
    @State private var imageOffset = 0.0
    let animationHeight: CGFloat = -50
    
    var body: some View {
        ZStack {
            Image(backGroundImageName)
                .resizable()
                .ignoresSafeArea()
            Image(characterImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 350)
                .offset(y: CGFloat(imageOffset) - 50)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                        imageOffset = animationHeight
                    }
                }
            VStack {
                HStack {
                    Button("閉じる") {
                        dismiss()
                    }
                    .padding(40)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.title)
                    Spacer()
                }
                Spacer()
                Text(star)
                    .font(.largeTitle)
                    .padding(.bottom, 50)
            }
        }
        .onAppear{
            let number = Int.random(in: 0...9)
            switch number {
            case 9:
                backGroundImageName = "bgBlue"
                characterImageName = "IoTMesh"
                star = "⭐️⭐️⭐️⭐️⭐️"
            case 8:
                backGroundImageName = "bgGreen"
                characterImageName = "camera"
                star = "⭐️⭐️⭐️⭐️"
            case 0...7:
                backGroundImageName = "bgRed"
                characterImageName = "iphone"
                star = "⭐️⭐️"
            default:
                backGroundImageName = ""
                characterImageName = ""
                star = ""
            }
        }
    }
}

#Preview {
    ResultView()
}
