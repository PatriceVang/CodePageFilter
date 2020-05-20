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
    @IBOutlet weak var heightVideoPlayer: NSLayoutConstraint!
    @IBOutlet weak var currentTimeLb: UILabel!
    @IBOutlet weak var sliderTime: UISlider!
    @IBOutlet weak var totalTimeLb: UILabel!
    @IBOutlet weak var backBtn: UIImageView!
    @IBOutlet weak var pausePlayBtn: UIImageView!
    @IBOutlet weak var nextBtn: UIImageView!
    @IBOutlet weak var containerV: UIView!
    @IBOutlet weak var videoPlayerV: UIView!
    //MARK: Probertis
    var player: AVPlayer?
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
    override func viewDidLoad() {
        super.viewDidLoad()
        heightVideoPlayer.constant = self.view.frame.width * 9/16
        setupPlayVideo()
        customItemsVieosPlyer()
    }

    private func customItemsVieosPlyer() {
        isTapedBackgroud = true
        indicator.startAnimating()
        containerV.backgroundColor = UIColor(white: 0, alpha: 1)
        containerV.setupTapGesture(view: containerV, selector: #selector(onTapBackgroudVideos), target: self)
        
        backBtn.setupTapGesture(view: backBtn, selector: #selector(onTapBackBtn), target: self)
        pausePlayBtn.setupTapGesture(view: pausePlayBtn, selector: #selector(onTapPausePlayBtn), target: self)
        nextBtn.setupTapGesture(view: nextBtn, selector: #selector(onTapNextBtn), target: self)
        sliderTime.addTarget(self, action: #selector(onChangeValueSlider), for: .valueChanged)
        containerV.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanGetureVideos(_:))))
        containerV.isUserInteractionEnabled = true
    }
    
    
    private func setupPlayVideo() {
        guard let mainUrl = URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2016/102w0bsn0ge83qfv7za/102/hls_vod_mvp.m3u8") else {return}
        player = AVPlayer(url: mainUrl)
        let playerPlayer = AVPlayerLayer(player: player)
        videoPlayerV.layer.addSublayer(playerPlayer)
        playerPlayer.frame = self.videoPlayerV.bounds
        playerPlayer.contentsGravity = .resizeAspectFill
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
            containerV.backgroundColor = .clear
            isPlaying = true
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
        print("back")
       
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
        print("next")
        
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
            if videoPlayerV.frame.minY >= self.view.frame.minY {
                self.videoPlayerV.center.y += translation.y
                
                if videoPlayerV.frame.minY < self.view.frame.minY {
                    videoPlayerV.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width / 9*16)
                }
                if videoPlayerV.center.y > self.view.center.y {
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                        
                        self.view.frame = .init(x: 10, y: self.view.frame.height - 200, width: self.view.frame.width - 20, height: 200)
                        self.videoPlayerV.frame = self.view.frame
                        self.containerV.isHidden = true
                        self.view.layoutIfNeeded()
                        
                    }) { (Bool) in
                    }
                }
            }
        case .ended:
            print("end")
        default:
           break
        }
    }
}
