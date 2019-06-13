//
//  UICollectionViewCell+Extension.swift
//  EmbededCollectionViewExample
//
//  Created by Admin on 13.06.2019.
//  Copyright © 2019 goncharov denis. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
  @IBOutlet public private(set) weak var labelView: UILabel? {
    get {
      let key = labelViewAssociationKeyPtr
      return objc_getAssociatedObject(self, key) as? UILabel
    }
    
    set {
      let key = labelViewAssociationKeyPtr
      objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_ASSIGN)
    }
  }
  
  private var labelViewAssociationKeyPtr: UnsafeRawPointer {
    let selector = #selector(getter: type(of: self).labelView)
    return unsafeBitCast(selector, to: UnsafeRawPointer.self)
  }
  
  @IBOutlet public private(set) weak var iconView: UIImageView? {
    get {
      let key = iconViewAssociationKeyPtr
      return objc_getAssociatedObject(self, key) as? UIImageView
    }
    
    set {
      let key = iconViewAssociationKeyPtr
      objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_ASSIGN)
    }
  }
  
  private var iconViewAssociationKeyPtr: UnsafeRawPointer {
    let selector = #selector(getter: type(of: self).iconView)
    return unsafeBitCast(selector, to: UnsafeRawPointer.self)
  }

}
