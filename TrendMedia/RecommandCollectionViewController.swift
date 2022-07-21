//
//  RecommendCollectionViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

private let reuseIdentifier = "Cell"

class RecommandCollectionViewController: UICollectionViewController {

    static let identity = "RecommandCollectionViewController"
    
    var imgURL = "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220509_176%2F1652081912471yhg3N_JPEG%2Fmovie_image.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        //Compositianal Layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as? RecommandCollectionViewCell else { return UICollectionViewCell() }
        
        let url = URL(string: "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220509_176%2F1652081912471yhg3N_JPEG%2Fmovie_image.jpg")
        
        cell.posterImgView.kf.setImage(with: url)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.view.makeToast("\(indexPath.item)번째 셀을 선택", duration: 0.1, position: .center, title: "123", image: nil) { _ in
            
            self.navigationController?.popViewController(animated: true)

        }
        
        
    }

}
