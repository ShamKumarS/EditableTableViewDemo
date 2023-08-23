//
//  DynamicHeightTableView.swift
//  Driven-Day
//
//  Created by BrainX IOS on 21/09/2022.
//

import UIKit

final class DynamicHeightTableView: UITableView {
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
