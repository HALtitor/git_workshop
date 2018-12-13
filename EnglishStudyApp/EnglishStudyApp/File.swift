//
//  File.swift
//  EnglishStudyApp
//
//  Created by uehara kazuma on 2018/11/29.
//  Copyright © 2018 uehara kazuma. All rights reserved.
//

import Foundation

class QuestionData {
    // 問題文
    var question: String
    //選択肢
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    
    // 正解の番号
    var correctAnswerNumber: Int
    
    // ユーザが選択した選択肢の番号
    var userChoiceAnswerNumber: Int?
    
    // 問題文の番号
    var questionNo: Int = 0
    
    // 解説文
    var kaisetu: String
    
    // クラスが生成された時の処理
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        answer1 = questionSourceDataArray[1]
        answer2 = questionSourceDataArray[2]
        answer3 = questionSourceDataArray[3]
        answer4 = questionSourceDataArray[4]
        correctAnswerNumber = Int(questionSourceDataArray[5])!
        kaisetu = questionSourceDataArray[6]
    }
    
    // ユーザが選択した答えが正解かどうか判定する
    func isCorrect() -> Bool {
        // 答えが一致しているかどうか判定する
        if correctAnswerNumber == userChoiceAnswerNumber {
            // 正解
            return true
        }
        // 不正解
        return false
    }
}

// クイズデータ全般の管理と生成を管理するクラス
class QuestionDataManager {
    
    // シングルトンのオブジェクトを生成
    static let sharedInstance = QuestionDataManager()
    
    // 問題を格納するための配列
    var questionDataArray = [QuestionData]()
    
    // 現在の問題のインデックス
    var nowQuestionIndex = 0
    
    // 初期化処理
    private init() {
        // シングルトンであることを保証するためにprivateで宣言しておく
    }
    
    // 問題文の読み込み処理
    func loadQuestion() {
        // 格納済みの問題文であればいったん削除しておく
        questionDataArray.removeAll()
        // 現在の問題のインデックスを初期化
        nowQuestionIndex = 0
        
        // csvファイルパスを取得
        guard let csvFilePath = Bundle.main.path(forResource: "100question", ofType: "csv") else {
            // csvファイルなし
            print("csvファイルが存在しません")
            return
        }
        
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: String.Encoding.utf8)
            // csvデータを1行ずつ読み込む
            csvStringData.enumerateLines { (line, stop) in
                // カンマ区切りで分割
                let questionSourceDataArray = line.components(separatedBy: ",")
                // 問題データを格納するオブジェクトを作成
                let questionData = QuestionData(questionSourceDataArray: questionSourceDataArray)
                // 問題を追加
                self.questionDataArray.append(questionData)
                // 問題番号を設定
                questionData.questionNo = self.questionDataArray.count
            }
        } catch let error {
            print("csvファイル読み込みエラーが発生しました\(error)")
            return
        }
    }
    

    func nextQuestion() -> QuestionData? {
        if questionDataArray.isEmpty {
            return nil
        }
        let nextQuestionIndex = Int(arc4random_uniform(UInt32(questionDataArray.count)))
        let nextQuestion = questionDataArray[nextQuestionIndex]
        questionDataArray.remove(at: nextQuestionIndex)
        return nextQuestion
    }
    
}
