//
//  QuestionViewController.swift
//  wordTech
//
//  Created by TakeuchiHaruki on 2016/02/13.
//  Copyright © 2016年 Haruki. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    
    var isAnswered: Bool = false
    var wordArray: [AnyObject] = []
    var shuffleWordArray: [AnyObject] = []
    var nowNumber: Int = 0
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        wordArray = saveData.arrayForKey("WORD")!
        shuffle()
        questionLabel.text = shuffleWordArray[nowNumber]["english"] as? String
    }
    
    func shuffle(){
        while wordArray.count>0{
            let index = Int(rand()) % wordArray.count
            shuffleWordArray.append(wordArray[index])
            wordArray.removeAtIndex(index)
        }
    }
    
    @IBAction func nextButtonPushed(){
        if isAnswered{
            nowNumber++
            answerLabel.text = ""
            
            if nowNumber < shuffleWordArray.count{
                questionLabel.text = shuffleWordArray[nowNumber]["english"] as? String
                isAnswered = false
                nextButton.setTitle("答えを表示", forState: UIControlState.Normal)
            }else{
                self.performSegueWithIdentifier("toFinishView", sender: nil)
            }
        }else{
            answerLabel.text = shuffleWordArray[nowNumber]["japanese"] as? String
            isAnswered = true
            nextButton.setTitle("次へ", forState: UIControlState.Normal)
        }
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

}
