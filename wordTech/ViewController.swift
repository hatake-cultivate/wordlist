//
//  ViewController.swift
//  wordTech
//
//  Created by TakeuchiHaruki on 2016/02/13.
//  Copyright © 2016年 Haruki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func startButtonTapped(){
        let saveData = NSUserDefaults.standardUserDefaults()
        
        if  let wordArray = saveData.arrayForKey("WORD"){
            if wordArray.count > 0{
                self.performSegueWithIdentifier("toQuestionView", sender: nil)
                return
            }
        }
        let alert: UIAlertController = UIAlertController(
            title: "単語",
            message: "まずは「単語一覧」をタップして単語を登録ください",
            preferredStyle: .Alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }


}

