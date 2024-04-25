//
//  FontHelper.swift
//  SwiftUIFun
//
//  Created by Raj Raval on 24/04/24.
//

import Foundation

enum FontName: String {
    case plusJakartaSans

    var name: String {
        rawValue.capitalized
    }
}

enum FontWeight: String {
    case extraLight
    case light
    case regular
    case medium
    case semiBold
    case bold
    case boldItalic
    case extraBold

    var name: String {
        "-" + rawValue.capitalized
    }
}

enum FontSize: CGFloat {
    case h0 = 48
    case h1 = 36
    case h2 = 34
    case h3 = 22
    case pLarge = 20
    case p = 18
    case pTwo = 14
    case pSmall = 16
    case pTiny = 12
    case pMicro = 10
}
