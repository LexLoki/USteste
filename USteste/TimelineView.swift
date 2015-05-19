//
//  TimelineView.swift
//  USteste
//
//  Created by Pietro Ribeiro Pepe on 5/18/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import Foundation
import UIKit

class TimelineView : UIView{
    
    var collectionView: UICollectionView!;
    var size: CGSize = CGSize();
    
    init(view: UIView, parent: UIViewController, modelo : StylesModel) {
        super.init(frame: view.frame);
        
        frame = view.frame;
        
        var tela:CGRect = CGRectMake(frame.size.width*0.06,
            frame.size.height*0.05,
            frame.size.width*0.88,
            frame.size.height*0.9);
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: tela.origin.y,
            left: tela.origin.x,
            bottom: 10,
            right: tela.origin.x);
        
        let tam = tela.width/(CGFloat(modelo.colunas)*1.2);
        size = CGSizeMake(tam, tam);
        layout.itemSize = size;
        collectionView = UICollectionView(frame: CGRectMake(frame.origin.x, frame.origin.y, frame.width, frame.height), collectionViewLayout: layout);
        collectionView.registerClass(CollectionCell.self, forCellWithReuseIdentifier: "cellIdentifier");
        collectionView!.backgroundColor = UIColor(red: 30.0/255, green: 48.0/255, blue: 68.0/255, alpha: 1.0);
        collectionView.layer.borderWidth = 4;
        collectionView.layer.borderColor = UIColor.blackColor().CGColor;
        
        view.addSubview(collectionView!)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}