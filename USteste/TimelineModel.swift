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
    
}
