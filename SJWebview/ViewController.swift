//
//  ViewController.swift
//  SJWebview
//
//  Created by 过保的chocolate on 2017/4/18.
//  Copyright © 2017年 gsj. All rights reserved.
//  使用小例

import UIKit

/*
 * 注意如果遇到某些带有导航栏的页面 出现webView内容页自动下沉的情况 下面的这行代码可以解决
 * automaticallyAdjustsScrollViewInsets = false
 */

class ViewController: UIViewController {

    let testUrl = "https://github.com/expiredchocolate/SJWebView"
    
    fileprivate var webView: SJWebview = {
        let web = SJWebview()
        // 与前端约定好的注册H5 的名字，没有与H5的交互则不用配置
        web.scriptName = ""
        return web
    }()
    /// 初始化一个没有交互的网页
    fileprivate var simpleWebView: SJWebview = {
        let web = SJWebview()
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSimpleWebView()
//        showComplexWebView()
        
    }
    
    /// 显示一个简单的（没有交互）网页
    func showSimpleWebView() {
        
        view.addSubview(simpleWebView)
        simpleWebView.snp.makeConstraints { (maker) in
            
            maker.edges.equalToSuperview()
        }
        
        // 开始网络请求 替换为你自己想加载的网页
        simpleWebView.startLoading(testUrl) {
            // 此处是没有地址的回调
        }

    }
    
    
    
    /// 显示一个有交互的网页
    func showComplexWebView() {
        
        // 如果有交互 在webView.scriptArray 添加需要注入JS 的变量
        webView.scriptArray.append("")
        // 显示这个webView
        view.addSubview(webView)
        webView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        // 开始网络请求
        webView.startLoading(testUrl) {
            // 此处是没有地址不能加载的回调
        }
        // 与H5交互的回调
        webView.userContentAction { (userContentController, receiveMessage) in
            
        //            receiveMessage.name 注册JS 的名字
        //            receiveMessage.body H5 传来的参数
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

