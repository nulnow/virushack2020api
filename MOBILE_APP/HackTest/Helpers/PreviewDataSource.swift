//
//  PreviewDataSource.swift
//  HackTest
//
//  Created by Данил Коротаев on 03.05.2020.
//  Copyright © 2020 Данил Коротаев. All rights reserved.
//

import Foundation
import UIKit
import QuickLook

class PreviewDataSource: QLPreviewControllerDataSource {
    
    let qlItems: [QLPreviewItem]
    
    init(qlItems: [QLPreviewItem]) {
        self.qlItems = qlItems
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        qlItems.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        qlItems[index]
    }
}
