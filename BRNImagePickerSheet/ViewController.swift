//
//  ViewController.swift
//  BRNImagePickerSheet
//
//  Created by Laurin Brandner on 04/09/14.
//  Copyright (c) 2014 Laurin Brandner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BRNImagePickerSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: View Lifecycle
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var sheet = BRNImagePickerSheet()
        sheet.delegate = self
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            sheet.showInView(self.view)
        }
    }
    
    // MARK: BRNImagePickerSheetDelegate
    
    func imagePickerSheet(imagePickerSheet: BRNImagePickerSheet, willDismissWithButtonIndex buttonIndex: Int) {
        if buttonIndex != imagePickerSheet.cancelButtonIndex {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = .PhotoLibrary
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
