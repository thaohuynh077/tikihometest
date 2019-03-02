//
//  ViewController.swift
//  Demo
//
//  Created by admin on 3/2/19.
//

import UIKit

class ItemViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var itemName: UILabel!
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var itemList : [HotItemsResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
       DispatchQueue.main.async {
            HotItemsProcessor().getItems { success, data in
                if success {
                    self.itemList = data.keywords ?? []
                    self.collectionView.reloadData()
                }
            }
       }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemViewCell", for: indexPath) as! ItemViewCell
        
        let url = URL(string: itemList[indexPath.row].icon)
        let data = try? Data(contentsOf: url!)
        cell.itemImage.image = UIImage(data: data!)
        let colorIndex = indexPath.row % 9
        cell.textView.backgroundColor = UIColor(hexString: Utils.colors[colorIndex])
        cell.itemName.text = itemList[indexPath.row].keyword
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = itemList[indexPath.row].keyword.width(withConstrainedHeight: 70) / 2
        let cellSize = CGSize(width: (width + 62) < 112 ? 112 : (width + 62), height: 300)
        
        return cellSize
    }
}

extension String {
    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)], context: nil)
        
        return ceil(boundingBox.width)
    }
}

