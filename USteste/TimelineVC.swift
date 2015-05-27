//
//  TimelineVC.swift
//  USteste
//
//  Created by Pietro Ribeiro Pepe on 5/18/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import Foundation
import UIKit

<<<<<<< HEAD


class TimelineVC:UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
{
    var timelineView: TimelineView!

    var modelo: StylesModel!

    var timeline: [TimelineModel]!

    var typesArray: [Int]!


    override func viewDidLoad()
    {
        // CARREGANDO CONFIGURACOES DO MODELO DE ESTILO
        modelo = StylesModel(tipo: 1)
=======
class TimelineVC:UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    var timelineView : TimelineView!;
    var modelo : StylesModel!;
    var timeline : Array<TimelineModel>!;
    var typesArray : Array<Int>!;
    
    override func viewDidLoad() {
        
        //CARREGANDO CONFIGURACOES DO MODELO DE ESTILO
        modelo = StylesModel(tipo: 1);
>>>>>>> origin/master
        
        // INICIALIZANDO SEM PLIST, PARA TESTAR JOGAMOS UM ARRAY DE 20 TIMELINEMODELS TENDO SO 1 TAMANHO
        timeline = [TimelineModel]()
        for (var i = 0 ; i < 20 ; i++) {
            timeline.append(TimelineModel(modelo: modelo, tam: i%3))
        }
        
        // TYPESARRAY é para ser usado para a montagem da collection
        typesArray = modelo.getArrayOfTypes(timeline)
        
        // CARREGANDO VIEW
        // Gambiarra
        let y = 40
        let origin = CGPoint(x: 0, y: y)
        let size = CGSize(width: CGFloat(view.frame.width), height: CGFloat(Int(view.frame.height) - y))
        timelineView = TimelineView(frame: CGRect(origin: origin, size: size))
        timelineView.model = modelo
        timelineView.collectionViewDelegate = self
        timelineView.collectionViewDataSource = self
        
        view.addSubview(timelineView)
        
        prepareLines()
    }
    
    func prepareLines(){
        let tam = timeline.count;
        let collection = timelineView.collectionView;
        let size = (collection.collectionViewLayout as! UICollectionViewFlowLayout).itemSize;
        for (var i=1; i<tam; i++){
            timeline[i].prepareLineWithImg(i, modelo: modelo, colView: collection);
            //timeline[i].prepareLine(i, modelo: modelo, colView: collection);
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var timelineCell : CollectionCell =    collectionView.dequeueReusableCellWithReuseIdentifier("cellIdentifier",
            forIndexPath: indexPath) as! CollectionCell;
        let tipo = typesArray[indexPath.row];
        if(tipo >= 0){
            timelineCell.setUpCell(timeline[tipo], tipo: tipo);
            if(tipo>0){
                //timelineCell.drawLine(modelo);
            }
        }
        else{
            timelineCell.reset();
        }
        return timelineCell;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typesArray.count;
    }
    
}