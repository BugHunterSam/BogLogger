//
//  HostingController.swift
//  BogLogger WatchKit Extension
//
//  Created by Samantha Connelly on 21/8/19.
//  Copyright © 2019 Samantha Connelly. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<PrivacyView> {
    override var body: PrivacyView {
        return PrivacyView()
    }
}

class RatingController: WKHostingController<RatingView> {
    override var body: RatingView {
        return RatingView()
    }
}
