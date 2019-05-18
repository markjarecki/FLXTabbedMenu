//
//  FLXPressGestureRecognizer.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

open class FLXPressGestureRecognizer: UIGestureRecognizer {
    
    // MARK: - Properties
    
    // MARK: Touch
    
    var trackedTouch: UITouch? = nil
    
    // MARK: - Override methods
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        
        super.touchesBegan(touches, with: event)
        
        /// Make sure there is only one touch
        if touches.count != 1 {
            
            state = .failed
            
        }
        
        /// Capture the first touch
        if trackedTouch == nil {
            
            if let firstTouch = touches.first {
                
                trackedTouch = firstTouch
                state = .began
                
            }
            
        } else {
            
            /// Ignore all but the first touch
            for touch in touches {
                
                if touch != trackedTouch {
                    
                    ignore(touch, for: event)
                    
                }
                
            }
            
        }
        
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        
        super.touchesMoved(touches, with: event)
        
        /// If move outside of view, fail the recogniser
        if trackedTouch != nil {
            
            let hitView: UIView? = view?.hitTest(trackedTouch!.location(in: view), with: event)
            
            guard hitView == nil else { return }
            
            state = .failed
            
        }
        
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        
        super.touchesEnded(touches, with: event)
        
        state = .ended
        
    }
    
    override open func reset() {
        
        super.reset()
        
        trackedTouch = nil
        
    }
    
}
