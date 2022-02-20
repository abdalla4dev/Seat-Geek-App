//
//  UIImage+Ext.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 20/02/2022.
//

import Foundation
import Kingfisher
import UIKit

// MARK: - UIImage

extension UIImage {
    public func rounded(radius: CGFloat) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIBezierPath(roundedRect: rect, cornerRadius: radius).addClip()
        draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    public enum DataUnits: String {
        case byte, kilobyte, megabyte, gigabyte
    }
    
    func getSizeIn(_ type: DataUnits) -> Double {
        guard let data = jpegData(compressionQuality: 0.5) else {
            return 0.0
        }
        
        var size: Double = 0.0
        
        switch type {
        case .byte:
            size = Double(data.count)
        case .kilobyte:
            size = Double(data.count) / 1024
        case .megabyte:
            size = Double(data.count) / 1024 / 1024
        case .gigabyte:
            size = Double(data.count) / 1024 / 1024 / 1024
        }
        
        return size
    }
}

// MARK: - UIImageView

extension UIImageView {
    func loadWebImage(imageUrl: String, placeHolder: UIImage) {
        startAnimating()
        var kf = self.kf
        kf.indicatorType = .activity
        let url = URL(string: imageUrl)
        self.kf.setImage(with: url,
                         placeholder: placeHolder,
                         options: [.transition(.fade(1))])
    }
}
