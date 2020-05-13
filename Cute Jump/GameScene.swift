//
//  GameScene.swift
//  Cute Jump
//
//  Created by xcode on 2/19/20.
//  Copyright © 2020 xcode. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var koala:SKSpriteNode? //player's character
    var oldGcloud:SKSpriteNode?//the good cloud the character is currently sitting on
    var oldBcloud:SKSpriteNode?//the bad cloud from the previous jump
    var gCloud:SKSpriteNode?//the good cloud to jump to
    var bCloud:SKSpriteNode?//the bad cloud to jump to
    var cloudSide = 0 //0 is left 1 is right for gCloud
    
    //sets background and intializes sprites
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background2.png")
        background.position = CGPoint(x:0, y:0)
        background.yScale = 1.5;
        addChild(background)
        gCloud = self.childNode(withName: "gCloud") as? SKSpriteNode
        bCloud = self.childNode(withName: "bCloud") as? SKSpriteNode
        koala = self.childNode(withName: "player") as? SKSpriteNode
        oldGcloud = self.childNode(withName: "oldGcloud") as? SKSpriteNode
    }
    
    //contains all the code for moving and creating a clouds
    func createCloud(){
        oldGcloud?.removeFromParent()
        oldBcloud?.removeFromParent()
        oldGcloud = gCloud
        oldBcloud = bCloud
        
        if (cloudSide == 0){
            oldGcloud!.position = CGPoint(x:-143.33, y:-579.22)
            oldBcloud!.position = CGPoint(x:153.016, y: -579.22)
        }
        if (cloudSide == 1){
            oldGcloud!.position = CGPoint(x:153.016, y: -579.22)
            oldBcloud!.position = CGPoint(x:-143.33, y:-579.22)
        }
        
        cloudSide = Int.random(in: 0...1)
        if(cloudSide == 0){
            print(cloudSide)
            gCloud = SKSpriteNode(imageNamed: "goodCloudSprite.png")
            gCloud!.size = CGSize(width: 223.399, height: 175.555)
            gCloud!.zPosition = 1
            gCloud!.position = CGPoint(x:-153.54, y:-306.64)
            bCloud = SKSpriteNode(imageNamed: "badCloudSprite.png")
            bCloud!.size = CGSize(width: 223.399, height: 175.555)
            bCloud!.zPosition = 1
            bCloud!.position = CGPoint(x:164.728, y:-306.64)
        }
        else{
            print(cloudSide)
            bCloud = SKSpriteNode(imageNamed: "badCloudSprite.png")
            bCloud!.size = CGSize(width: 223.399, height: 175.555)
            bCloud!.zPosition = 1
            bCloud!.position = CGPoint(x:-153.54, y:-306.64)
            gCloud = SKSpriteNode(imageNamed: "goodCloudSprite.png")
            gCloud!.size = CGSize(width: 223.399, height: 175.555)
            gCloud!.zPosition = 1
            gCloud!.position = CGPoint(x:164.728, y:-306.64)
        }
        self.addChild(gCloud!)
        self.addChild(bCloud!)
    }
    
    //displays game over function when a bad cloud is clicked
    func gameOver(){
        let gameOver = SKSpriteNode(imageNamed: "gameOver.png")
        gameOver.position = CGPoint(x:0, y:0)
        gameOver.zPosition = 1
        gameOver.size = CGSize(width:544.616, height:486.977)
        addChild(gameOver)
        gCloud?.removeFromParent()
        bCloud?.removeFromParent()
        oldBcloud?.removeFromParent()
        oldGcloud?.removeFromParent()
        koala?.removeFromParent()
        //display game over message
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    //handles movement of koala and calls cloud creation method or game over method when a cloud is tapped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        print("touched")
        if gCloud!.contains(touch.location(in: self)){
            createCloud()
            if(cloudSide == 0){
                koala!.position = CGPoint(x:-153.54, y:-443.14)
            }
            if(cloudSide == 1){
                koala!.position = CGPoint(x:164.727, y:-443.14)
            }
            
        }
        
        if bCloud!.contains(touch.location(in:self)){
            gameOver()
            print("game")
        }
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
