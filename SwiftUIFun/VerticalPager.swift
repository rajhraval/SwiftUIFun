//
//  VerticalPager.swift
//  SwiftUIFun
//
//  Created by Raj Raval on 21/04/24.
//

import SwiftUI

struct VerticalPager: View {
    
    private let colors: [Color] = [.pink, .orange, .indigo, .green]
    private let morningAffirmations = [
        "I am grateful for a new day filled with endless opportunities.",
        "I am confident in my abilities and ready to tackle any challenges that come my way.",
        "I radiate positivity and attract positive energy into my life.",
        "I embrace change as a chance to grow and learn."
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                ForEach(colors.indices, id: \.self) { color in
                    ZStack {
                        colors[color]
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Affirmation \(color + 1).")
                                .font(.system(size: 36).bold())
                                .foregroundStyle(.white.opacity(0.7))
                            Text(morningAffirmations[color])
                                .font(.system(size: 48).bold())
                                .foregroundStyle(.white)
                        }
                        .padding()
                    }
                    .containerRelativeFrame(.vertical)
                }
            }
        }
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    VerticalPager()
}
