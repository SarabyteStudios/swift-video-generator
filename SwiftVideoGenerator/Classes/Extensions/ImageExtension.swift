//
//  ImageExtension.swift
//  VideoGeneration
//
//  Created by DevLabs BG on 25.10.17.
//  Copyright © 2017 Devlabs. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// Method to scale an image to the given size while keeping the aspect ratio
    ///
    /// - Parameter newSize: the new size for the image
    /// - Returns: the resized image
    func scaleImageToSize(newSize: CGSize) -> UIImage? {
        
        var scaledImageRect: CGRect = CGRect.zero
        
        scaledImageRect.size.width = 368
        scaledImageRect.size.height = 216
        
        scaledImageRect.origin.x = (newSize.width - scaledImageRect.size.width) / 2.0
        scaledImageRect.origin.y = (newSize.height - scaledImageRect.size.height) / 2.0
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        if UIGraphicsGetCurrentContext() != nil {
            draw(in: scaledImageRect)
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return scaledImage
        }
        
        return nil
    }
    
    /// Method to get a size for the image appropriate for video (dividing by 16 without overlapping 1200)
    ///
    /// - Returns: a size fit for video
    func getSizeForVideo() -> CGSize {
        //    let scale = UIScreen.main.scale
        //    var imageWidth = 16 * ((size.width / scale) / 16).rounded(.awayFromZero)
        //    var imageHeight = 16 * ((size.height / scale) / 16).rounded(.awayFromZero)
        //    var ratio: CGFloat!
        //
        //    if imageWidth > 1400 {
        //      ratio = 1400 / imageWidth
        //      imageWidth = 16 * (imageWidth / 16).rounded(.towardZero) * ratio
        //      imageHeight = 16 * (imageHeight / 16).rounded(.towardZero) * ratio
        //    }
        //
        //    if imageWidth < 800 {
        //      ratio = 800 / imageWidth
        //      imageWidth = 16 * (imageWidth / 16).rounded(.awayFromZero) * ratio
        //      imageHeight = 16 * (imageHeight / 16).rounded(.awayFromZero) * ratio
        //    }
        //
        //    if imageHeight > 1200 {
        //      ratio = 1200 / imageHeight
        //      imageWidth = 16 * (imageWidth / 16).rounded(.towardZero) * ratio
        //      imageHeight = 16 * (imageHeight / 16).rounded(.towardZero) * ratio
        //    }
        //
        return CGSize(width: 368, height: 216)
    }
    
    
    /// Method to resize an image to an appropriate video size
    ///
    /// - Returns: the resized image
    func resizeImageToVideoSize() -> UIImage? {
        let scale = UIScreen.main.scale
        let imageRect = CGRect(x: 0, y: 0, width: 368, height: 216)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageRect.width, height: imageRect.height), false, scale)
        if let _ = UIGraphicsGetCurrentContext() {
            draw(in: imageRect, blendMode: .normal, alpha: 1)
            
            if let resultImage = UIGraphicsGetImageFromCurrentImageContext() {
                UIGraphicsEndImageContext()
                return resultImage
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}

