//
//  CardEffect.swift
//  SwiftUIFun
//
//  Created by Raj Raval on 25/04/24.
//

import SwiftUI
import Pow

struct CardEffect: View {

    @State private var offset: CGFloat = 0
    @State private var scaleSize: CGFloat = 1
    @State private var flipped = false
    @State private var showPoof = false

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            VStack(spacing: 24) {
                ZStack {
                    CardView()
                        .rotation3DEffect(
                            flipped ? .degrees(30) : .zero,
                            axis: (x: 1, y: 0, z: 0)
                        )
                        .offset(y: offset)
                        .scaleEffect(x: scaleSize, y: scaleSize)
                    if !showPoof {
                        Text("")
                            .transition(.movingParts.poof)
                    }
                }
                Button(action: {
                    if !flipped {
                        withAnimation(.bouncy) {
                            flipped = true
                            offset = geo.frame(in: .global).maxY
                            scaleSize = 0
                        }
                    } else {
                        withAnimation(.bouncy) {
                            offset = 0
                            scaleSize = 1
                            flipped = false
                        }
                    }
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            showPoof.toggle()
                        }
                    }
                }) {
                    Text(flipped ? "Revert" : "AirPoof")
                        .font(.system(size: 18, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                        .padding(.horizontal, 24)
                        .background(.purp)
                }
                .clipShape(.capsule)
            }
            .frame(width: width, height: height)
        }
        .background(Color.offWhite)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 31)
                .fill(.white)
                .frame(height: 400)
            Image(.image)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
                .padding(24)
        }
        .shadow(color: .black.opacity(0.1), radius: 21, x: 0, y: -3)
        .padding(.horizontal, 38)
    }
}

#Preview {
    CardEffect()
}

//RoundedRectangle(cornerRadius: 22)
//    .fill(.pink)
//    .frame(height: 400)
//    .padding(.horizontal, flipped ? 72 : 48)
//    .rotation3DEffect(
//        flipped ? .degrees(30) : .zero,
//        axis: (x: 1, y: 0, z: 0)
//    )
//    .onTapGesture {
//        withAnimation(.bouncy) {
//            flipped = true
//            offset = geo.frame(in: .global).maxY
//            scaleSize = 0
//        }
//    }
//    .offset(y: offset)
//    .scaleEffect(x: scaleSize, y: scaleSize)
//    .transition(.movingParts.poof)
//Button("Reset") {
//    withAnimation {
//        offset = 0
//        scaleSize = 1
//        flipped = false
//    }
//}
//.buttonBorderShape(.capsule)
//.buttonStyle(.bordered)
//.tint(.pink)
