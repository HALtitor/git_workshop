//
//  MakeQuestionViewController.swift
//  EnglishStudyApp
//
//  Created by 高松　拓実 on 2019/01/04.
//  Copyright © 2019 uehara kazuma. All rights reserved.
//

import UIKit

class MakeQuestionViewController: UIViewController {
    
    
    @IBOutlet weak var QuesionName: UITextField!
    var QuestionNameString = ""
    @IBOutlet weak var GoodAnswer: UITextField!
    var GoodAnswerString  = ""
    @IBOutlet weak var Commentary: UITextField!
    var CommentaryString = ""
    @IBOutlet weak var Commentary2: UITextField!
    var Commentary2String = ""
    @IBOutlet weak var Coomentary3: UITextField!
    var Commentary3String = ""
    @IBOutlet weak var Comentary4: UITextField!
    var Commentary4String = ""
    
    @IBOutlet weak var AnsNum: UITextField!
    var AnsNumString = ""
    
    @IBOutlet weak var CComentary: UITextField!
    var CComentaryString = ""

    @IBOutlet var MakeButten: UIButton!
    var age:String = "testtesttest"
    let textFileName = "test3"
    let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
    let textFileName2 = "test2.csv"
    let documentDirectoryFileURL2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
   // let targetTextFilePath = documentDirectoryFileURL.appendingPathComponent(textFileName2)
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        createAndWriteTextFile()
     //   appendText(fileURL: targetTextFilePath , string: age)
     //   readTextFile(fileURL: targetTextFilePath)
    }
   


    func createAndWriteTextFile() {
        
        // 作成するテキストファイルの名前
        //let textFileName = "test2.csv"
       // let initialText = "最初に書き込むテキスト"
        
        
        guard let csvFilePath = Bundle.main.path(forResource: "MakeQuestion", ofType: "csv") else {
            // csvファイルなし
            print("csvファイルが存在しません")
            return
        }
            let url = URL(fileURLWithPath: csvFilePath)
           
        print(url)
        do{
            //appendText(fileURL: url, string: age)
            readTextFile(fileURL: url)
        }
        

 
    }
 
    func appendText(fileURL: URL, string: String) {
        
        do {
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            
            // 改行を入れる
            let stringToWrite = "\n" 
            let kannma = ","
            let bunn = "の意味は何？"
            let space = "  "
            let kote = "\""
            // ファイルの最後に追記
            fileHandle.seekToEndOfFile()
            fileHandle.write(QuestionNameString.data(using: String.Encoding.utf8)!)
            fileHandle.write(bunn.data(using: String.Encoding.utf8)!)
            
            fileHandle.write(kannma.data(using: String.Encoding.utf8)!)
            fileHandle.write(GoodAnswerString.data(using: String.Encoding.utf8)!)
             fileHandle.write(kannma.data(using: String.Encoding.utf8)!)
            fileHandle.write(Commentary2String.data(using: String.Encoding.utf8)!)
             fileHandle.write(kannma.data(using: String.Encoding.utf8)!)
            fileHandle.write(Commentary3String.data(using: String.Encoding.utf8)!)
             fileHandle.write(kannma.data(using: String.Encoding.utf8)!)
            fileHandle.write(Commentary4String.data(using: String.Encoding.utf8)!)
            fileHandle.write(kannma.data(using: String.Encoding.utf8)!)
              fileHandle.write(AnsNumString.data(using: String.Encoding.utf8)!)
             fileHandle.write(kannma.data(using: String.Encoding.utf8)!)
            fileHandle.write(kote.data(using: String.Encoding.utf8)!)
            fileHandle.write(QuestionNameString.data(using: String.Encoding.utf8)!)
             fileHandle.write(space.data(using: String.Encoding.utf8)!)
             fileHandle.write(CComentaryString.data(using: String.Encoding.utf8)!)
            fileHandle.write(kote.data(using: String.Encoding.utf8)!)
            fileHandle.write(stringToWrite.data(using: String.Encoding.utf8)!)
            print("オッケー")
        } catch let error as NSError {
            print("failed to append: \(error)")
        }
    }
    
    func readTextFile(fileURL: URL) {
        do {
            let text = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
            print(text)
        } catch let error as NSError {
            print("failed to read: \(error)")
        }
    }

    
    @IBAction func MakeQuestionDoing(_ sender: Any) {
        guard let csvFilePath = Bundle.main.path(forResource: "MakeQuestion", ofType: "csv") else {
            // csvファイルなし
            print("csvファイルが存在しません")
            return
        }
        let url = URL(fileURLWithPath: csvFilePath)
        appendText(fileURL: url, string:age)
        readTextFile(fileURL: url)

    }


    @IBAction func QName(_ sender: Any) {
        QuestionNameString = QuesionName.text!
      
    }
    
    @IBAction func Answer(_ sender: Any) {
       GoodAnswerString = GoodAnswer.text!
       
    }
    
    @IBAction func BadCommentary1(_ sender: Any) {
        CommentaryString = Commentary.text!
       
    }

    @IBAction func BadCommentary2(_ sender: Any) {
        Commentary2String = Commentary2.text!
       
    }
    
    @IBAction func BadCommentary3(_ sender: Any) {
        Commentary3String = Coomentary3.text!
      
    }
    @IBAction func BadCommentary4(_ sender: Any) {
        Commentary4String = Comentary4.text!
       
    }
    
    @IBAction func ANum(_ sender: Any) {
         AnsNumString = AnsNum.text!
    }
    
    @IBAction func CCom(_ sender: Any) {
        CComentaryString = CComentary.text!
    }
    
    
}




