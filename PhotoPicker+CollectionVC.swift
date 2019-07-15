

import Foundation
import UIKit
import SDWebImage
extension PhotoPickerVC : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout ,UICollectionViewDelegate  {
    
   
    func setupCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 2.5, left: 2.5, bottom: 2.5, right: 2.5)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionview = UICollectionView(frame: CGRect(x: 0, y: 0 , width: SCREEN_WIDTH, height: SCREEN_HEIGHT), collectionViewLayout:layout)
        
        collectionview.collectionViewLayout = layout
        
        
        collectionview.dataSource = self
        collectionview.delegate = self
       // collectionview.isPagingEnabled = true
        
        
        
        
        collectionview.register(UINib(nibName: "PickerCell", bundle: nil), forCellWithReuseIdentifier: "PickerCell")
        
        
        
        
        collectionview.showsVerticalScrollIndicator = false
        collectionview.isScrollEnabled = true
        collectionview.clipsToBounds = false
        
        collectionview.backgroundColor = .white//UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        // self.view.backgroundColor = collectionview.backgroundColor
        
        
        self.view.addSubview(collectionview)
        collectionview.reloadData()
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return urlList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickerCell", for: indexPath as IndexPath) as! PickerCell
        
        //        if let collageView = CollageView.loadFromNibNamed(nibNamed: "CollageType\(indexPath.row+1)", bundle: nil) as? CollageView {
        //            collageView.frame = CGRect(x: 0.0, y: 0.0, width: 150, height: 150)
        //            //collageView.btnClick.isHidden = true
        //            cell.contentView.addSubview(collageView)
        //
        //        }
        
        if arrSelectedIndex.contains(indexPath) { // You need to check wether selected index array contain current index if yes then change the color
            cell.backgroundColor = UIColor.lightGray
        }
        else {
            cell.backgroundColor = UIColor.white
        }
        let url = urlList[indexPath.row]
        if let imageData = NSData(contentsOf: url) {
            cell.img.image = UIImage(data: imageData as Data) // Here you can attach image to UIImageView
        }
        
        return cell
        
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        //        let padding: CGFloat =  25
        //        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: size  , height: 100)
    }
    //
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
      
        let strData = urlList[indexPath.item]
        if arrSelectedIndex.contains(indexPath) {
            arrSelectedIndex = arrSelectedIndex.filter { $0 != indexPath}
            arrSelectedData = arrSelectedData.filter { $0 != strData}
           
        }
        else {
            arrSelectedIndex.append(indexPath)
            arrSelectedData.append(strData)
            print(collageType,arrSelectedData.count)
            
            
        }
       validationForDoneButton()
        
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left:0, bottom: 0, right: 0)
    }
    
    func validationForDoneButton(){
        if collageType >= arrSelectedData.count{
            
            add!.isEnabled = true
        }else{
             add!.isEnabled  = false
        }
        if arrSelectedData.count == 0 {
           add!.isEnabled  = false
        }
    }
    //]
}


