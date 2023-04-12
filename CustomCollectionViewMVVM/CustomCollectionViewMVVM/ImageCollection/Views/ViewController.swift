//
//  ViewController.swift
//  CustomCollectionViewMVVM
//
//  Created by Manoj Kumar on 10/04/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var photosCollectionView:UICollectionView!
    let photosViewModel:PhotosViewModel = PhotosViewModel()
    var photosList:PhotosModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.register(UINib(nibName: "PhotosListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotosListCollectionViewCell")
        photosCollectionView.dataSource = self
        //photosCollectionView.delegate = self
//        if let collectionViewLayout = photosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//                   collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//               }
        getPhotosList(currentPage: 1)
    }
    
    private func getPhotosList(currentPage:Int){
        photosViewModel.getPhotos(page: currentPage, completion: { result in
            self.photosList = result
            DispatchQueue.main.async {
                self.photosCollectionView.reloadData()
            }
        })
    }
    
    
}


extension ViewController:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.photosList?.photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let photos = self.photosList?.photos,let strURl = photos[indexPath.row].src?.original,let imgURL = URL(string: strURl){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosListCollectionViewCell", for: indexPath) as! PhotosListCollectionViewCell
            cell.backgroundColor = .cyan
            cell.photoImageView.loadImage(fromurl: imgURL)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let photos = self.photosList?.photos,let height = photos[indexPath.row].height,let width = photos[indexPath.row].width{
            let frameWidth = collectionView.frame.width
            let newHeight:CGFloat = CGFloat((height/width)) * (collectionView.frame.width/2-10)
            return CGSize(width: frameWidth, height: newHeight)
        }
        return CGSize.zero
    }
}

