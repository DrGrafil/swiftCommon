//
//  EmailViewController.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 2/25/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import UIKit
import MessageUI
// https://www.andrewcbancroft.com/2014/08/25/send-email-in-app-using-mfmailcomposeviewcontroller-with-swift/



class EmailMessanger: MFMailComposeViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // http://kellyegan.net/sending-files-using-swift/
    func sendEmail(email:Email, controller:UIViewController){

        if(MFMailComposeViewController.canSendMail()){
            //let mailComposer = MFMailComposeViewController()
            self.mailComposeDelegate = self
            
            self.setSubject(email.subject)
            self.setToRecipients(email.to)
            self.setCcRecipients(email.cc)
            self.setBccRecipients(email.bcc)
            self.setMessageBody(email.body, isHTML: email.isHTML)
            
            for file in email.files {
                if let data = file.data {
                    self.addAttachmentData(data, mimeType: file.mimeType, fileName: file.swiftFileName)
                }
                else {
                    mailError(.BadFile, addedReason: file.fileName)
                }
                
            }
            controller.presentViewController(self, animated: true, completion: nil)
        }
        else {
            mailError(.CantSend)
        }
    }

    func sendEmail(to:String, controller:UIViewController) {
        let email = Email(to:[to])
        sendEmail(email, controller:controller)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    enum mailErrorCase {
        case CantSend
        case BadFile
        case Unkown
    }
    
    func mailError( reason:mailErrorCase, addedReason:String = "" ){
        
        var alertMessage:String
        
        switch(reason){
            case .CantSend:
                alertMessage = "Can't send any e-mail from device"
            case .BadFile:
                alertMessage = "File:" + addedReason + " can't be found/added to email"
            default:
                alertMessage = "An unkown error has occured while sending the email"
        }
        
        let alertController = UIAlertController(title: "Email Error", message:
            alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
}
