//
//  TimelineModel.swift
//  USteste
//
//  Created by Pietro Ribeiro Pepe on 5/18/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import Foundation
import UIKit

class TimelineModel{
    
    var tamanho : Float!;
    var imagem : UIImage!;
    
    var line : UIImage!;
    var linePosition : CGPoint!;
    
    
    init(modelo : StylesModel, tam : Int){
        
        let dict = modelo.dictSize;
        tamanho = dict[tam] as! Float;
    }
    /*
    func prepareLine(index: Int, size : CGSize, modelo : StylesModel){
        let resto1 = index%modelo.quant;
        let resto2 = (index+1)%modelo.quant;
        let distance = CGSizeMake(CGFloat(modelo.dictX[resto2] - modelo.dictX[resto1])*size.width, (modelo.dictY[resto2] + (resto2/modelo.quant)*modelo.quant - modelo.dictY[resto1] + (resto1/modelo.quant)*modelo.quant)*size.height);
        
        
    }
*/
    func prepareLine(index : Int, modelo : StylesModel, colView : UICollectionView){
        let pointFrom = modelo.getCoordinatePoint(index);
        let pointTo = modelo.getCoordinatePoint(index-1);
        
        let size = (colView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize;
        let x:CGFloat = (pointFrom.x<=pointTo.x) ? 0.0 : 1.0;
        let y:CGFloat = (pointFrom.y<=pointTo.y) ? 0.0 : 1.0;
        var sizeAux = CGSizeMake(CGFloat(abs(pointFrom.x-pointTo.x))*size.width, CGFloat(abs(pointFrom.y-pointTo.y))*size.height);
        sizeAux = CGSizeMake((sizeAux.width==0) ? 1 : sizeAux.width, (sizeAux.height==0) ? 1 : sizeAux.height);
        let bounds = CGRect(origin: CGPointZero, size: sizeAux);
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(bounds.size, opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        // Setup complete, do drawing here
        CGContextSetStrokeColorWithColor(context, UIColor.orangeColor().CGColor)
        CGContextSetLineWidth(context, 2.0)
        
        linePosition = CGPointMake(x*bounds.size.width, y*bounds.size.height);
        let fromP = linePosition;
        let toP = CGPointMake(bounds.size.width-fromP.x, bounds.size.height-fromP.y);
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, fromP.x, fromP.y)
        CGContextAddLineToPoint(context, toP.x, toP.y)
        CGContextStrokePath(context)
        
        // Drawing complete, retrieve the finished image and cleanup
        line = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    func prepareLineWithImg(index : Int, modelo : StylesModel, colView : UICollectionView){
        //STR IGUAL A NOME DO TRACO
        let str = "but";
        
        let pointFrom = modelo.getCoordinatePoint(index);
        let pointTo = modelo.getCoordinatePoint(index-1);
        
        let size = (colView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize;
        let x:CGFloat = (pointFrom.x<=pointTo.x) ? 0.0 : 1.0;
        let y:CGFloat = (pointFrom.y<=pointTo.y) ? 0.0 : 1.0;
        var sizeAux = CGSizeMake(CGFloat(abs(pointFrom.x-pointTo.x))*size.width, CGFloat(abs(pointFrom.y-pointTo.y))*size.height);
        sizeAux = CGSizeMake((sizeAux.width==0) ? 1 : sizeAux.width, (sizeAux.height==0) ? 1 : sizeAux.height);
        linePosition = CGPointMake(x*sizeAux.width, y*sizeAux.height);
        
        let angle:CGFloat = (x==0.0) ? (y==0.0) ? 0 : 90 : (y==0.0) ? 270 : 180;
        // angulo = 180*x + 90*y
        line = UIImage(named: str)?.imageRotatedByDegrees(angle, flip: false);
        line = line.imageResizedTo(sizeAux);
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
}
