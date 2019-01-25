//
//  AnimationFactory.swift
//  TableViewAnimationDemo
//
//  Created by 陈志勇 on 2019/1/25.
//  Copyright © 2019 makepower. All rights reserved.
//

import UIKit

enum AnimationFactory {
    static func makeFade(duration: TimeInterval, delayFactor: Double) -> Animation {
        return {cell, indexPath, _ in
            cell.alpha = 0;
            UIView.animate(withDuration: duration, delay: delayFactor * Double(indexPath.row), options: [], animations: {
                cell.alpha = 1
            }, completion: nil)
        }
    }

    static func makeLeft() -> Animation {
        return {cell, indexPath, _ in
            cell.frame = CGRect(x: cell.frame.size.width, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), options: [], animations: {
                cell.frame = CGRect(x: 0, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
            }, completion: nil)
        }
    }

    static func makeDamping() -> Animation {
        return {cell, indexPath, _ in
            cell.transform = CGAffineTransform(scaleX: 1, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.05, usingSpringWithDamping: 1, initialSpringVelocity: 25, options: [], animations: {
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }

    static func makeDampingAndFade() -> Animation {
        return {cell, indexPath, _ in
            cell.transform = CGAffineTransform(scaleX: 1, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 1, initialSpringVelocity: 25, options: [], animations: {
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
}
