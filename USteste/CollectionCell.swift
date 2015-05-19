//
//  CollectionCell.swift
//  USteste
//
//  Created by Pietro Ribeiro Pepe on 5/18/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import Foundation
import UIKit

class CollectionCell : UICollectionViewCell{
    
    var imageView: UIImageView!;
    var id: Int!;
    var label : UILabel!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        imageView = UIImageView();
        imageView.center = CGPointMake(0.5*self.frame.width, 0.5*self.frame.height);
        imageView.layer.zPosition = 10;
        label = UILabel();
        label.center = imageView.center;
        label.bounds.size = self.frame.size;
        label.textAlignment = NSTextAlignment.Center;
        self.contentView.addSubview(imageView);
        self.addSubview(label);

    }
    
    func setUpCell(timeline : TimelineModel, tipo : Int) {
        
        
        //AQUI PEGAR IMAGEM BASEADO NO TIMELINEMODEL
        let size = CGSizeMake(CGFloat(timeline.tamanho)*self.frame.width, CGFloat(timeline.tamanho)*self.frame.height);
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
        
        if(tipo>0){
            //drawCustomImage();
        }
        
    }
    
    func reset(){
        imageView.image = nil;
        label.text = nil;
        id = -1;
    }
    
    /*
    func drawCustomImage(from: EventButton, to: EventButton) -> UIImage {
        // Setup our context
        let bounds = CGRect(origin: CGPoint.zeroPoint, size: myView.contentsView.frame.size);
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(bounds.size, opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        // Setup complete, do drawing here
        CGContextSetStrokeColorWithColor(context, UIColor.orangeColor().CGColor)
        CGContextSetLineWidth(context, 2.0)
        
        let fromP = CGPointMake(from.frame.origin.x+from.frame.width*0.5, from.frame.origin.y+from.frame.height*0.5);
        let toP = CGPointMake(to.frame.origin.x+to.frame.width*0.5, to.frame.origin.y+to.frame.height*0.5);
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, fromP.x, fromP.y)
        CGContextAddLineToPoint(context, toP.x, toP.y)
        CGContextStrokePath(context)
        
        // Drawing complete, retrieve the finished image and cleanup
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    */
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}