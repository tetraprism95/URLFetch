//
//  ViewController.swift
//  URLFetch
//
//  Created by Nuri Chun on 4/23/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit

class URLSessionController: UIViewController
{
    
    let fetchButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Fetch", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 40 / 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(handleFetch), for: .touchUpInside)
        return button
    }()
    
    let postButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Post", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 40 / 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(handlePost), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupButtonStackView()
    }
    
    @objc func handleFetch()
    {
        print("Fetch button pressed...")
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error
            {
                print("ERROR 404:", error)
            }
            
            if let response = response
            {
                print("RESPONSE:", response)
            }
            
            if let data = data
            {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    @objc func handlePost()
    {
        print("Post button pressed...")
        
        let params = ["username" : "Marcochun21", "email" : "tetraprism95@gmail.com"]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else { return }
        
        request.httpBody = httpBody
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let error = error
            {
                print("ERROR 404:", error)
            }
            
            if let response = response
            {
                print("RESPONSE:", response)
            }
            
            if let data = data
            {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) 
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    fileprivate func setupButtonStackView()
    {
        let stackView = UIStackView(arrangedSubviews: [fetchButton, postButton])
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 150

        self.view.addSubview(stackView)
        
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, padTop: 150, padLeft: 100, padBottom: 0, padRight: 100, width: 0, height: 300)
    
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

