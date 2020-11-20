//
//  File.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 12.11.2020.
//

import Foundation
import UIKit

class Configuration {

func configureTable(_ table: UITableView){
    table.frame = table.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 10))
    table.layer.cornerRadius = 25
}
}

extension UIView {

    public var width: CGFloat {
        return frame.size.width
    }

    public var height: CGFloat {
        return frame.size.height
    }

    public var top: CGFloat {
        return frame.origin.y
    }

    public var bottom: CGFloat {
        return frame.size.height + frame.origin.y
    }

    public var left: CGFloat {
        return frame.origin.x
    }

    public var right: CGFloat {
        return frame.size.width + frame.origin.x
    }

}

