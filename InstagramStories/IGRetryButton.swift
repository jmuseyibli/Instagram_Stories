//
//  IGRetryButton.swift
//  InstagramStories
//
//  Created by Boominadha Prakash on 15/07/18.
//  Copyright © 2018 Dash. All rights reserved.
//

import Foundation
import UIKit

protocol RetryBtnDelegate: class {
    func retryImageRequest(sender: IGRetryLoaderButton, withURL url: String)
}

public class IGRetryLoaderButton: UIButton {
    var contentURL: String?
    weak var delegate: RetryBtnDelegate?
    deinit {debugPrint("Retry button removed")}
    convenience init(withURL url: String) {
        self.init()
        self.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        self.setImage(#imageLiteral(resourceName: "ic_retry"), for: .normal)
        self.addTarget(self, action: #selector(didTapRetryBtn(sender:)), for: .touchUpInside)
        self.contentURL = url
        self.tag = 100
    }
    @objc func didTapRetryBtn(sender: IGRetryLoaderButton) {
        delegate?.retryImageRequest(sender: sender, withURL: sender.contentURL!)
    }
}

extension UIView {
    func removeRetryButton() {
        self.subviews.forEach({v in
            if(v.tag == 100){v.removeFromSuperview()}
        })
    }
    
}
