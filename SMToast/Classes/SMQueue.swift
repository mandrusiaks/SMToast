//
//  SMQueue.swift
//  Pods
//
//  Created by Spencer Mandrusiak on 2017-03-05.
//
//

import UIKit

class SMQueue: NSObject {
    fileprivate var toastQueue: [SMToast] = []
    
    var size: Int {
        return toastQueue.count
    }
    var first: SMToast? {
        return toastQueue.first
    }
    var last: SMToast? {
        return toastQueue.last
    }
    var toasts: [SMToast] {
        return toastQueue
    }
}

//MARK: - Operations
extension SMQueue {
    func add(toast: SMToast) {
        toastQueue.append(toast)
    }
    func remove(at index: Int) {
        toastQueue.remove(at: index)
    }
    func remove(toast: SMToast) {
        if toastQueue.contains(toast) {
            for i in 0..<toastQueue.count {
                let queuedToast = toastQueue[i]
                if queuedToast.id == toast.id {
                    toastQueue.remove(at: i)
                    break
                }
            }
        }

    }
}
