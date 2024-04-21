//
//  ContentTransitionExample.swift
//  SwiftUIFun
//
//  Created by Raj Raval on 21/04/24.
//

import SwiftUI

struct ContentTransitionExample: View {

    @State private var totalSpent = 5000

    var emoji: String {
        switch totalSpent {
        case 0..<10000:
            return "🥲"
        case 10000..<15000:
            return "😢"
        case 15000..<20000:
            return "😥"
        case 20000..<25000:
            return "😓"
        case 25000..<30000:
            return "😭"
        default:
            return "😱"
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer().frame(height: 24)
            HStack {
                Spacer().frame(width: 24)
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 4) {
                        Image(systemName: "indianrupeesign.circle.fill")
                        Text("Total Spent")
                    }
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(.white).opacity(0.8)
                    Text("\(totalSpent)")
                        .contentTransition(.numericText(value: Double(totalSpent)))
                        .font(.system(size: 48)).bold()
                        .foregroundStyle(.white)
                }
                Spacer()
            }
            Spacer()
            HStack(alignment: .lastTextBaseline) {
                Spacer().frame(width: 24)
                ZStack {
                    Text(emoji)
                        .font(.system(size: 36))
                }
                .padding(6)
                .background(.white)
                .clipShape(.rect(cornerRadius: 14))
                Spacer()
                Button("Refresh") {
                    withAnimation(.linear) {
                        totalSpent += 5000
                    }
                }
                .font(.headline)
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.indigo)
                .tint(.white)
                .buttonBorderShape(.capsule)
                Spacer().frame(width: 24)
            }
            Spacer().frame(height: 24)
        }
        .frame(width: 256, height: 256)
        .background(.indigo.gradient)
        .clipShape(.rect(cornerRadius: 36, style: .continuous))
        .fontDesign(.rounded)
    }
}

#Preview {
    ContentTransitionExample()
}
