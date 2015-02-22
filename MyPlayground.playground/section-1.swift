// Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

1+1

class MyController : UITableViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:"cell")
    }
    
    override func tableView(tableView:UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = "Swift"
        
        return cell
    }
}
var controller = MyController()
controller.view



//HTMLのデータ読み込み

//var urlString = "http://www.apple.com"

//NSURLとしてURL
/*var url = NSURL(string: urlString)!

var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {data, response, error in
    
    var strin = NSString(data: data!, encoding:NSUTF8StringEncoding)!
})

task.resume()
XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)*/

class MyParserDelegate: NSObject, NSXMLParserDelegate{
    
    func parser(parser: NSXMLParser!,
        didStartElement elementName: String!,
        qualifiedName qName: String!,
        attributes attributeDict:[NSObject : AnyObject]!)
    {
        println("開始タグ \(elementName)")
    }
}

var urlString = "http://rss.dailynews.yahoo.co.jp/fc/rss.xml"
var url = NSURL(string: urlString)

var parser = NSXMLParser(contentsOfURL: url)

var delgate = MyParserDelegate()
parser?.delegate = delgate

parser?.parse()
