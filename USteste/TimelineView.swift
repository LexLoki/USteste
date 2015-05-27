//
//  TimelineView.swift
//  USteste
//
//  Created by Pietro Ribeiro Pepe on 5/18/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import Foundation
import UIKit

class TimelineView : UIView
{
    var collectionView: UICollectionView!
    
    var size: CGSize = CGSize()

    // Gambiarra
    var model: StylesModel! {
        didSet {
            loadView()
        }
    }
    
    // Gambiarra
    var collectionViewDelegate: UICollectionViewDelegate! {
        didSet {
            collectionView.delegate = collectionViewDelegate
        }
    }
    
    // Gambiarra
    var collectionViewDataSource: UICollectionViewDataSource! {
        didSet {
            collectionView.dataSource = collectionViewDataSource
        }
    }
    
    
    override init (frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
    // Gambiarra
    private func loadView ()
    {
        var tela:CGRect = CGRectMake(frame.size.width * 0.06,
        frame.size.height * 0.05,
        frame.size.width * 0.88,
        frame.size.height * 0.9)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: tela.origin.y,
            left: tela.origin.x,
            bottom: 10,
            right: tela.origin.x)
        
        let tam = tela.width/(CGFloat(model.colunas) * 1.07)
        
        size = CGSizeMake(tam, tam)
        
        layout.itemSize = size
        
        collectionView = UICollectionView(frame: CGRectMake(frame.origin.x, frame.origin.y, frame.width, frame.height), collectionViewLayout: layout)
        collectionView.registerClass(CollectionCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        collectionView!.backgroundColor = UIColor(red: 30.0/255, green: 48.0/255, blue: 68.0/255, alpha: 1.0)
        collectionView.layer.borderWidth = 4
        collectionView.layer.borderColor = UIColor.blackColor().CGColor
        
        addSubview(collectionView!)
    }
}