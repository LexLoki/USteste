//
//  StylesModel.swift
//  USteste
//
//  Created by Pietro Ribeiro Pepe on 5/18/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import Foundation


class StylesModel{
    
    var dictX : NSDictionary!;
    var dictY : NSDictionary!;
    var dictSize : NSDictionary!;
    
    private var size : Int!;
    var quant : Int!;
    var colunas : Int!;
    
    
    init(tipo: Int){
        
        if(tipo==1){
            definirEstilo1();
        }
        else if(tipo==2){
            
        }
        else if(tipo==3){
            
        }
        
    }
    
    private func definirEstilo1(){
        let keys = NSArray(array: [0,1,2,3]) as! [Int];
        let valuesX = NSArray(array: [0,2,1,0]) as! [Int];
        let valuesY = NSArray(array: [0,1,2,1]) as! [Int];
        
        let keySize = NSArray(array: [0, 1 , 2]) as! [Int];
        let valuesSize = NSArray(array: [0.6, 0.8, 1.0]) as! [Float];
        
        dictX = NSDictionary(objects: valuesX, forKeys: keys);
        dictY = NSDictionary(objects: valuesY, forKeys: keys);
        
        dictSize = NSDictionary(objects: valuesSize, forKeys: keySize);
        
        size=9;
        quant = keys.count;
        colunas = 3;
        
    }
    
    private func getPositionIndex(index : Int) -> Int{
        let aux:Int = index%self.quant;
        let posY:Int = (dictY[aux] as! Int) * colunas ;
        let posX:Int = dictX[aux] as! Int;
        return ((index/self.quant) * size) + posX + posY;
    }
    
    func getArrayOfTypes(timeline : Array<TimelineModel>) -> Array<Int>{
        let quant = getPositionIndex(timeline.count-1)+1;
        var array = Array<Int>();
        var percorre:Int = 0;
        for(var i=0;i<timeline.count;i++){
            let pos = getPositionIndex(i);
            while(percorre<pos){
                array.append(-1);
                percorre = percorre+1;
            }
            
            if(pos < array.count){
                array.removeAtIndex(pos);
            }
            
            array.insert(i, atIndex: pos);
        }
        return array;
    }
    
}