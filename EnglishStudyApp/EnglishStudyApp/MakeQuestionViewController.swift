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
            appendText(fileURL: url, string: age)
            readTextFile(fileURL: url)
        }
        
        /*
        do {
            try writeToFile.write(to: url, atomically: true, encoding: String.Encoding.utf8)
            }
 */
        /*
        // DocumentディレクトリのfileURLを取得
        if let documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            
            // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
            let targetTextFilePath = documentDirectoryFileURL.appendingPathComponent(textFileName)
            
            print("書き込むファイルのパス: \(targetTextFilePath)")
            appendText(fileURL: targetTextFilePath,string: initialText)
            do {
                try initialText.write(to: targetTextFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("failed to write: \(error)")
            }
        }
        */
 
    }
 
    func appendText(fileURL: URL, string: String) {
        
        do {
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            
            // 改行を入れる
            let stringToWrite = "\n" + string
            
            // ファイルの最後に追記
            fileHandle.seekToEndOfFile()

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
/*
        let outputStr = dataList.joined(separator: "\n")
        print("3 通過・outputStr -> \(outputStr)")
        do {
            if(outputStr == "") {
                //部活配列が空の場合はユーザーが保存したCSVファイルを削除する。
                try fileManager.removeItem(atPath: userPath)
            } else {
                //ファイルを出力する。
                try outputStr.write(toFile: userPath, atomically: false, encoding: String.Encoding.utf8 )
            }
        } catch {
            print(error)
        }
    }
 */
    }

    @IBAction func QuestionName(_ textField: UITextField) {
        // TextFieldから文字を取得
        QuestionNameString = QuesionName.text!
        print(QuestionNameString)
        
    }
    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


