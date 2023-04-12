//
//  LazyImageView.swift
//  CustomCollectionViewMVVM
//
//  Created by Manoj Kumar on 12/04/23.
//

import Foundation
import UIKit

class LazyImageView:UIImageView{
    private let imageCache = NSCache<AnyObject,UIImage>()
    
    func loadImage(fromurl imageURL:URL,placeholderImage:String = "placeholderImage"){
        self.image = UIImage(named: placeholderImage)
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject){
            self.image = cachedImage
        }
        
        DispatchQueue.global().async {
            [weak self] in
            
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {
                        self!.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
