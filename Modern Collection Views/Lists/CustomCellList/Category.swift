//  Created by dasdom on 04.07.20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

struct Category: Hashable {
    let icon: UIImage?
    let name: String?
    
    static let music = Category(icon: UIImage(systemName: "music.mic"), name: "Music")
    static let transportation = Category(icon: UIImage(systemName: "car"), name: "Transportation")
    static let weather = Category(icon: UIImage(systemName: "cloud.rain"), name: "Weather")
}
