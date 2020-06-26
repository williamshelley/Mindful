//
//  DayCell.swift
//  Mindful
//
//  Created by William Shelley on 6/25/20.
//  Copyright © 2020 William Shelley. All rights reserved.
//

import UIKit

class DayCell: UICollectionViewCell {
    
    
    var button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
        
    func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "DayCell", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func commonInit() {
        button = UIButton(frame: bounds)
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)

        addSubview(button)
        
        backgroundColor = .systemTeal
    }
    
    @objc func onTap() {
        print(button.currentTitle ?? "empty")
    }
}
