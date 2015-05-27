//
//  CollectionCell.swift
//  USteste
//
//  Created by Pietro Ribeiro Pepe on 5/18/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import Foundation
import UIKit

class CollectionCell : UICollectionViewCell
{
    
    var imageView: UIImageView!;
    var id: Int!;
    var label : UILabel!;
    var lineView: UIImageView!;
    
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        lineView = UIImageView();
        lineView.contentMode = UIViewContentMode.ScaleToFill;
        imageView = UIImageView();
        imageView.center = CGPointMake(0.5 * self.frame.width, 0.5 * self.frame.height);
        imageView.layer.zPosition = 10;
        label = UILabel();
        label.center = imageView.center;
        label.bounds.size = self.frame.size;
        label.textAlignment = NSTextAlignment.Center;
        self.contentView.addSubview(lineView);
        self.contentView.addSubview(imageView);
        self.addSubview(label);
    }
    
    func setUpCell(timeline : TimelineModel, tipo : Int)
    {
        //AQUI PEGAR IMAGEM BASEADO NO TIMELINEMODEL
        let size = CGSizeMake(CGFloat(timeline.tamanho) * self.frame.width, CGFloat(timeline.tamanho) * self.frame.height);
        imageView.bounds.size = size;
        //imageView.frame = CGRectMake(0.5*(self.frame.width-size.width), 0.5*(self.frame.height-size.height), size.width, size.height);
        imageView.image = UIImage(named: "circle");
        imageView.contentMode = UIViewContentMode.ScaleAspectFill;
        
        imageView.clipsToBounds = true;
        imageView.layer.cornerRadius = imageView.frame.size.height/2;
        imageView.layer.masksToBounds = true;
        imageView.layer.borderWidth = 0;
        
        label.text = String(format: "%i", tipo);
        
        id=tipo;
        
        if(tipo > 0)
        {
            setLine(timeline);
        }
            
        else
        {
            lineView.image = nil;
        }
    }
    
    private func setLine(timeline : TimelineModel)
    {
        let or = CGPointMake(imageView.center.x - timeline.linePosition.x, imageView.center.y - timeline.linePosition.y);
        lineView.frame = CGRect(origin: or, size: timeline.line.size);
        lineView.image = timeline.line;
    }
    
    func reset()
    {
        lineView.image = nil;
        imageView.image = nil;
        label.text = nil;
        id = -1;
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}