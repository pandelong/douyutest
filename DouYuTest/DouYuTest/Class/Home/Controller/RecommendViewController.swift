//
//  RecommendViewController.swift
//  DouYuTest
//
//  Created by pp on 2019/4/18.
//  Copyright © 2019 pp. All rights reserved.
//

import UIKit


private let kItemMargin : CGFloat = 10
private let kItemW : CGFloat = (kScreenW - 3 * kItemMargin) / 2
private let kItemH : CGFloat = kItemW * 3 / 4
private let kHeanderViewH :CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"

class RecommendViewController: UIViewController {

    //mark lazy
    private lazy var collectionView : UICollectionView = {[weak self] in
        //layout
        let layout = UICollectionViewFlowLayout();
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = kItemMargin;
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeanderViewH);
        //uicollectionview
        let collectionView = UICollectionView(frame:CGRect.zero , collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
      
    //    collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader" , withReuseIdentifier: kHeaderViewID)
        
       collectionView.register(CollectionHeaderCode_View.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: kHeaderViewID)
        
        return collectionView;
    }()
    
    //mark 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI();
    }
}
//ui
extension RecommendViewController {
    private func setupUI() {
        
        self.edgesForExtendedLayout = [];
        
        self.view .addSubview(collectionView);
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview();
        }
    }
}


extension RecommendViewController : UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        
        cell.backgroundColor = .red;
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //  取出section的 headerview
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
     
        return headerView;
    }
    
}
