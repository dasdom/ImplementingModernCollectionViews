//  Created by dasdom on 04.07.20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

// Declare an extension on the cell state struct to provide a typed property for this custom state.
extension UICellConfigurationState {
    var item: Item? {
        set { self[.item] = newValue }
        get { return self[.item] as? Item }
    }
}

// Declare a custom key for a custom `item` property.
fileprivate extension UIConfigurationStateCustomKey {
    static let item = UIConfigurationStateCustomKey("com.apple.ItemListCell.item")
}
