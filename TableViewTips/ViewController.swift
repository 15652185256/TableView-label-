//
//  ViewController.swift
//  TableViewTips
//
//  Created by 赵晓东 on 16/5/30.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    
    let demo0Description = "自动布局动画，修改一个view的布局约束，其他view也会自动重新排布";
    let demo1Description = "1.设置view1高度根据子view而自适应(在view1中加入两个子view(testLabel和testView)，然后设置view1高度根据子view内容自适应)\n2.高度自适应lable\n3.宽度自适应label";
    let demo2Description = "1.自定义button内部label和imageView的位置\n2.设置间距固定自动调整宽度的一组子view\n3.设置宽度固定自动调整间距的一组子view";
    let demo3Description = "简单tableview展示";
    let demo4Description = "1.行间距为8的attributedString的label";
    let demo5Description = "1.利用普通view的内容自适应功能添加tableheaderview\n2.利用自动布局功能实现cell内部图文排布，图片可根据原始尺寸按比例缩放后展示\n3.利用“普通版tableview的cell高度自适应”完成tableview的排布";
    let demo6Description = "展示scrollview的内容自适应和普通view的动态圆角处理";
    let demo7Description = "利用“普通版tableview的《多cell》高度自适应”2步设置完成tableview的排布";
    let demo8Description = "利用“升级版tableview的《多cell》高度自适应”1步完成tableview的排布。\n注意：升级版方法适用于cell的model有多个的情况下,性能比普通版稍微差一些,不建议在数据量大的tableview中使用（cell数量尽量少于100个）,如果有大量的cell或者cell界面复杂渲染耗费性能较大则推荐使用普通方法简化版“cellHeightForIndexPath:model:keyPath:cellClass:contentViewWidth:”方法同样是一步设置即可完成";
    let demo9Description = "利用SDAutoLayout仿制微信朋友圈。高仿微信计划：\n1.高仿朋友圈 \n2.完善细节 \n3.高仿完整微信app \nPS：代码会持续在我的github更新";
    let demo10Description = "一个SDAutoLayout使用者“李西亚”同学贡献的仿网易新闻界面";
    let demo11Description = "仿微信的聊天界面：\n1.纯文本消息（带可点击链接，表情）\n2.图片消息";
    let demo12Description = "scroll任意布局内容自适应";
    let demo13Description = "scroll任意布局内容自适应自动布局";
    let demo14Description = "xib的cell高度自适应";
    
    
    var contenArray : [String]!
    
    var dataDict:Dictionary<String,String> = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.contenArray = [demo0Description, demo1Description, demo2Description, demo3Description, demo4Description, demo5Description, demo6Description, demo7Description, demo8Description, demo9Description, demo10Description, demo11Description, demo12Description, demo13Description, demo14Description]
        
        self.createNav()
        
        self.createView()
    }
    
    //创建头部
    func createNav() {
        //设置页面背景
        self.view.backgroundColor = UIColor.whiteColor()
        
        //设置导航不透明
        self.navigationController?.navigationBar.translucent = false
        
        //设置导航的标题
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:RGBA (255.0, g:255.0, b: 255.0, a: 1),NSFontAttributeName:UIFont.systemFontOfSize(18)]
        self.navigationItem.title = "tableView 自适应高度"
        
        //设置导航背景图
        self.navigationController?.navigationBar.barTintColor = RGBA (86.0, g:173.0, b: 216.0, a: 1)
    }
    
    //创建页面
    func createView() {
        //self.tableView.separatorStyle =  UITableViewCellSeparatorStyle.None//去掉分割线 一
        //self.tableView.tableFooterView = UIView() //去掉分割线 二
        
        //self.tableView.separatorInset = UIEdgeInsetsZero //分割线偏移量设为零 方法一
        
        //cell 自适应高度
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.contenArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        //cell.selectionStyle = UITableViewCellSelectionStyle.None//点击不选中 状态
        
        // Configure the cell...
        let contentLabel = cell.contentView.viewWithTag(1000) as! UILabel
        contentLabel.text = self.contenArray[indexPath.row]
        
        if dataDict[String(indexPath.row)] == "0" {
            contentLabel.numberOfLines = 0
        } else {
            contentLabel.numberOfLines = 1
        }
        
        
        return cell
    }
    
    //返回 cell 高度
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
//        let aMsg = self.contenArray[indexPath.row]
//        
//        let size = getTextRectSize(aMsg, font: 15, size: CGSizeMake(WIDTH-30, 0))
//        
//        let height = size.height + 20
//        
//        return height
//    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        let contentLabel = cell!.contentView.viewWithTag(1000) as! UILabel
        
        tableView.beginUpdates()
        
        if contentLabel.numberOfLines == 0 {
            contentLabel.numberOfLines = 1
            dataDict[String(indexPath.row)] = "1"
        } else {
            contentLabel.numberOfLines = 0
            dataDict[String(indexPath.row)] = "0"
        }
        
        tableView.endUpdates()
        
        //tableView.reloadData()
        //tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }

//    override func viewDidLayoutSubviews() {
//        self.tableView.separatorInset = UIEdgeInsetsZero//分割线偏移量设为零 方法二
//        self.tableView.layoutMargins = UIEdgeInsetsZero
//    }
  
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero//分割线偏移量设为零 方法三
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        for cell in self.tableView.visibleCells {
            //页面上显示的cell的动画
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

