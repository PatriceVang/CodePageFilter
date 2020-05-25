//
//  TestVideosLaucher.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/19/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import AVFoundation

class VideosLaucher: UIViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var currentTimeLb: UILabel!
    
    @IBOutlet weak var sliderTime: UISlider!
    @IBOutlet weak var totalTimeLb: UILabel!
    @IBOutlet weak var backBtn: UIImageView!
    @IBOutlet weak var pausePlayBtn: UIImageView!
    @IBOutlet weak var nextBtn: UIImageView!
    @IBOutlet weak var controllerV: UIView!
    @IBOutlet weak var videoPlayerV: UIView!
    //MARK: Probertis
    var player: AVPlayer?
    var playerPlayer: AVPlayerLayer!
    var isPlaying: Bool = false
    var isTapedBackgroud: Bool = false {
        didSet {
            if isTapedBackgroud {
                currentTimeLb.isHidden = false
                totalTimeLb.isHidden = false
                sliderTime.isHidden = false
                pausePlayBtn.isHidden = false
                backBtn.isHidden = false
                nextBtn.isHidden = false
                Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (Timer) in
                    self.isTapedBackgroud = false
                }
            } else {
                currentTimeLb.isHidden = true
                totalTimeLb.isHidden = true
                sliderTime.isHidden = true
                pausePlayBtn.isHidden = true
                backBtn.isHidden = true
                nextBtn.isHidden = true
            }
        }
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayVideo()
        customItemsVieosPlyer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        videoPlayerV.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width * 9/16)
        controllerV.frame = videoPlayerV.frame
        playerPlayer.frame = self.videoPlayerV.frame
    }
    
    private func customItemsVieosPlyer() {
        
        isTapedBackgroud = true
        indicator.startAnimating()
        controllerV.backgroundColor = UIColor(white: 0, alpha: 1)
        controllerV.setupTapGesture(view: controllerV, selector: #selector(onTapBackgroudVideos), target: self)
        
        backBtn.setupTapGesture(view: backBtn, selector: #selector(onTapBackBtn), target: self)
        pausePlayBtn.setupTapGesture(view: pausePlayBtn, selector: #selector(onTapPausePlayBtn), target: self)
        nextBtn.setupTapGesture(view: nextBtn, selector: #selector(onTapNextBtn), target: self)
        sliderTime.addTarget(self, action: #selector(onChangeValueSlider), for: .valueChanged)
        controllerV.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanGetureVideos(_:))))
        controllerV.isUserInteractionEnabled = true
        videoPlayerV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapContainerV(_:))))
        videoPlayerV.isUserInteractionEnabled = true
    }
    
    private func setupPlayVideo() {
        guard let mainUrl = URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2016/102w0bsn0ge83qfv7za/102/hls_vod_mvp.m3u8") else {return}
        player = AVPlayer(url: mainUrl)
        playerPlayer = AVPlayerLayer(player: player)
        videoPlayerV.layer.addSublayer(playerPlayer)
        playerPlayer.contentsGravity = .resize
        player?.play()
        player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
        let interval = CMTime(value: 1, timescale: 2)
        //lay time hien tai cho lable curent
        player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (progressTime) in
        let seconds = CMTimeGetSeconds(progressTime)
        let secondsString = String(format: "%02d", Int(seconds) % 60)
        let minuteString = String(format: "%02d", Int(seconds) / 60)
        self.currentTimeLb.text = "\(minuteString):\(secondsString)"
        //keo thanh slider
        if let duration = self.player?.currentItem?.duration {
        let duraTionSeconds = CMTimeGetSeconds(duration)
            self.sliderTime.value = Float(seconds / duraTionSeconds)
            }
        })
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        // khi video chay thi no se setup ui duoi nay
        if keyPath == "currentItem.loadedTimeRanges" {
            indicator.stopAnimating()
            indicator.isHidden = true
            controllerV.backgroundColor = .clear
            isPlaying = true
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (Timer) in
                self.isTapedBackgroud = false
            }
            
            isTapedBackgroud = false
            if let duration = player?.currentItem?.duration {
                let durationBySeconds = CMTimeGetSeconds(duration)
                let minute = Int(durationBySeconds) / 60
                let secondsText = Int(durationBySeconds) % 60
                totalTimeLb.text = "\(minute):\(secondsText)"
            }
        }
    }
    
    //MARK: Handle tap
    @objc func onTapBackgroudVideos() {
        print("tap")
        isTapedBackgroud = !isTapedBackgroud
    }
    
    @objc func onTapBackBtn() {
        let currentTime = CMTimeGetSeconds((player?.currentTime())!)
        var backwardTime = 0
        if currentTime < 10 {
            backwardTime = 0
        } else {
            backwardTime = Int(currentTime - 10)
        }
        if player != nil {
            player?.seek(to: CMTime(seconds: Double(backwardTime), preferredTimescale: 1), completionHandler: { (Bool) in
                
            })
        }
    }
    @objc func onTapPausePlayBtn() {
        if isPlaying {
            player?.pause()
            pausePlayBtn.image = Resource.Image.playImg
        } else {
            player?.play()
            pausePlayBtn.image = Resource.Image.pauseImg
        }
        isPlaying = !isPlaying
    }
    
    @objc func onTapNextBtn() {
        let duration = player?.currentItem?.duration
        let totalSecond = CMTimeGetSeconds(duration!)
        let currentTime = CMTimeGetSeconds((player?.currentTime())!)
        var nextTime = 0
        if currentTime + 10 >= totalSecond  {
            nextTime = Int(totalSecond)
        } else {
            nextTime = Int(currentTime + 10)
        }
        if player != nil {
            player?.seek(to: CMTime(seconds: Double(nextTime), preferredTimescale: 1), completionHandler: { (Bool) in
                
            })
        }
    }
    
    @objc func onChangeValueSlider() {
        // slider tu dong chay
        if let duration = player?.currentItem?.duration {
            let totalSecond = CMTimeGetSeconds(duration)
            let value = Double(sliderTime.value) * totalSecond
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            player?.seek(to: seekTime, completionHandler: { (handle) in
            })
        }
    }
    
    @objc func onPanGetureVideos(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view)
        switch pan.state {
        case .began, .changed:
            self.videoPlayerV.center.y += translation.y
            if videoPlayerV.frame.minY < self.view.frame.minY {
                self.videoPlayerV.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width * 9/16)
            }
            if videoPlayerV.frame.minY >= 5 {
                UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    self.view.frame = .init(x: self.view.frame.origin.x + 0.2, y: self.view.frame.origin.y + 10, width: self.view.frame.width - 0.4, height: self.view.frame.height)
                }) { (Bool) in
                }
            }
        case .ended:
            if self.view.frame.minY >= self.view.frame.width / 3  {
                self.controllerV.isHidden = true
                self.view.frame = .init(x: 10, y: UIScreen.main.bounds.height / 1.4, width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width / 2.5)
                
                self.videoPlayerV.frame = .init(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height)
                self.videoPlayerV.transform = CGAffineTransform(scaleX: 0.5, y: 1)
                self.view.transform = CGAffineTransform(scaleX: 1, y: 0.5)
                
            } else {
                self.view.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
        default:
           break
        }
    }
    
    @objc func onTapContainerV(_ tap: UITapGestureRecognizer) {
        if self.view.frame.minY > UIScreen.main.bounds.height / 2 {
            self.view.transform = .identity
            self.videoPlayerV.transform = .identity
            self.view.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            self.controllerV.isHidden = false
        }
    }
}
