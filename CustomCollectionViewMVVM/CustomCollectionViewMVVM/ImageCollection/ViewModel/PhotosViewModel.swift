//
//  PhotosViewModel.swift
//  CustomCollectionViewMVVM
//
//  Created by Manoj Kumar on 11/04/23.
//

import Foundation


struct PhotosViewModel{
    func getPhotos(page:Int,per_page:Int = 10,completion: @escaping(_ result: PhotosModel?)->Void){
        let photoRequest = PhotoRequestModel(page: page)
        let photoResource = PhotosResource()
        photoResource.getPhotos(photoRequest: photoRequest) { result in
            _=completion(result)
        }
    }
}
