//
//  ContentView.swift
//  SwiftUIFun
//
//  Created by Raj Raval on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Vertical Pager") {
                    VerticalPager()
                }
                NavigationLink("Content Transition Modifier") {
                    ContentTransitionExample()
                }
            }
            .navigationTitle("Examples")
        }
    }
}

#Preview {
    ContentView()
}
