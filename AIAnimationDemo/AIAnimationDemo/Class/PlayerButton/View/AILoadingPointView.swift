//
//  AILoadingPointView.swift
//  AIAnimationDemo
//
//  Created by aizexin on 2017/8/24.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

import UIKit

class AILoadingPointView: UIView {

    var textLayer:CATextLayer!
    var timer :Timer!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textLayer                 = CATextLayer()
        textLayer.alignmentMode   = kCAAlignmentLeft
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.isWrapped       = true
        textLayer.string          = "loading..."
        textLayer.contentsScale   = UIScreen.main.scale

        self.layer.addSublayer(textLayer)
        
        var array = ["loading","loading.","loading..","loading..."]
        var index = 0
        timer     = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {[weak self] (timer) in
            
            self?.textLayer.string = array[index % 4]
            index += 1
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        textLayer.frame           = self.bounds
    }
    
    
}
