//  Created by dasdom on 04.07.20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

struct Item: Hashable {
    let category: Category
    let image: UIImage?
    let title: String?
    let description: String?
    init(category: Category, imageName: String? = nil, title: String? = nil, description: String? = nil) {
        self.category = category
        if let systemName = imageName {
            self.image = UIImage(systemName: systemName)
        } else {
            self.image = nil
        }
        self.title = title
        self.description = description
    }
    private let identifier = UUID()
    
    static let all = [
        Item(category: .music, imageName: "headphones", title: "Headphones",
             description: "A portable pair of earphones that are used to listen to music and other forms of audio."),
        Item(category: .music, imageName: "hifispeaker.fill", title: "Loudspeaker",
             description: "A device used to reproduce sound by converting electrical impulses into audio waves."),
        Item(category: .transportation, imageName: "airplane", title: "Plane",
             description: "A commercial airliner used for long distance travel."),
        Item(category: .transportation, imageName: "tram.fill", title: "Tram",
             description: "A trolley car used as public transport in cities."),
        Item(category: .transportation, imageName: "car.fill", title: "Car",
             description: "A personal vehicle with four wheels that is able to carry a small number of people."),
        Item(category: .weather, imageName: "hurricane", title: "Hurricane",
             description: "A tropical cyclone in the Caribbean with violent wind."),
        Item(category: .weather, imageName: "tornado", title: "Tornado",
             description: "A destructive vortex of swirling violent winds that advances beneath a large storm system."),
        Item(category: .weather, imageName: "tropicalstorm", title: "Tropical Storm",
             description: "A localized, intense low-pressure system, forming over tropical oceans."),
        Item(category: .weather, imageName: "snow", title: "Snow",
             description: "Atmospheric water vapor frozen into ice crystals falling in light flakes.")
    ]
}
