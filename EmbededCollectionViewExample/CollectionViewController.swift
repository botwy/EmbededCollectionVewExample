//
//  CollectionViewController.swift
//  EmbededCollectionViewExample
//
//  Created by Admin on 13.06.2019.
//  Copyright © 2019 goncharov denis. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout {
  @IBOutlet weak var collectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      let layout: UICollectionViewFlowLayout
      if let some = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        layout = some
      } else {
        layout = UICollectionViewFlowLayout()
      }
      layout.scrollDirection = .horizontal
    //  layout.estimatedItemSize = CGSize(width: 1, height: 1)
     // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
     // collectionView.collectionViewLayout = layout
    }
  
  func estimateFrameForLabel(label: String) -> CGRect {
    let size = CGSize(width: 100, height: 600)
    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)]
    let frame = NSString(string: label).boundingRect(with: size, options: options, attributes: attributes, context: nil)
    print(frame)
    return frame
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    var string = ""
    switch indexPath.row {
    case 0:
      string = "yandex yandex yandex yandex yandex yandex yandex yandex yandex yandex"
    case 1:
      string = "rbc"
    default:
      ()
    }
    
    let height = 60 + estimateFrameForLabel(label: string).height + 10
    
    return CGSize(width: 100, height: height)
  }
    
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
//    let tableHeaderHeight = tableHeaderView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
//    if tableHeaderHeight == tableHeaderView.bounds.height {
//      return
//    }
//    tableHeaderView.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: tableHeaderView.bounds.width, height: tableHeaderHeight))
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CollectionViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    if let iconView = cell.iconView {
      iconView.layer.cornerRadius = 24
      iconView.backgroundColor = UIColor.purple
    }
    
    switch indexPath.row {
    case 0:
      cell.labelView?.text = "yandex yandex yandex yandex yandex yandex yandex yandex yandex yandex"
    case 1:
      cell.labelView?.text = "rbc"
    default:
      ()
    }
    
    return cell
  }
  
  
}
