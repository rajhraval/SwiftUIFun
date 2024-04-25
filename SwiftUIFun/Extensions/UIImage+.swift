//
//  UIImage+.swift
//  SwiftUIFun
//
//  Created by Raj Raval on 24/04/24.
//

import UIKit.UIImage
import CoreImage.CIFilterBuiltins

extension UIImage {
    static func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(string.utf8)

        let transform = CGAffineTransform(scaleX: 10, y: 10) // Scale up the image by 10x

        if let outputImage = filter.outputImage?.transformed(by: transform),
           let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        } else {
            // Return a default image if QR code generation fails
            return UIImage(systemName: "xmark.circle") ?? UIImage()  // Ensure this fallback never fails
        }
    }
}
