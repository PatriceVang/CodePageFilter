//
//  VideosLaucher.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class VideoPlayer: UIView {
    var player: AVPlayer?
    var isPlaying:Bool = false
    let indicator: UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView(style: .large)
        ind.translatesAutoresizingMaskIntoConstraints = false
        ind.startAnimating()
        return ind
    }()
    let pausePlayBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "pause"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(onTapPauseBtn(_sender:)), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    let contrainerV: UIView = {
       let v = UIView()
        v.backgroundColor = UIColor(white: 0, alpha: 1)
        return v
    }()
    let videoLenghtLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let slider: UISlider = {
       let slider = UISlider()
        slider.tintColor = .red
        slider.thumbTintColor = .red
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .white
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(onChangeValueSlider), for: .valueChanged)
        return slider
    }()
    
 

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        contrainerV.frame = self.frame
        self.addSubview(contrainerV)
        //add indicator
        contrainerV.addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: contrainerV.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: contrainerV.centerYAnchor).isActive = true
        
        contrainerV.addSubview(pausePlayBtn)
        pausePlayBtn.centerXAnchor.constraint(equalTo: contrainerV.centerXAnchor).isActive = true
        pausePlayBtn.centerYAnchor.constraint(equalTo: contrainerV.centerYAnchor).isActive = true
        pausePlayBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pausePlayBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
       
        contrainerV.addSubview(videoLenghtLb)
        self.setupLabelFor(lable: videoLenghtLb, text: "00:00", textColor: .white, font: .systemFont(ofSize: 17))
        videoLenghtLb.trailingAnchor.constraint(equalTo: contrainerV.trailingAnchor, constant: -5).isActive = true
        videoLenghtLb.bottomAnchor.constraint(equalTo: contrainerV.bottomAnchor, constant: -5).isActive = true
        
        contrainerV.addSubview(slider)
        slider.trailingAnchor.constraint(equalTo: videoLenghtLb.leadingAnchor, constant: -5).isActive = true
        slider.bottomAnchor.constraint(equalTo: contrainerV.bottomAnchor).isActive = true
        slider.leadingAnchor.constraint(equalTo: contrainerV.leadingAnchor, constant: 0).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        setupPlayVideo()
    }
    
    func setupPlayVideo() {

        guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/wwdc/2016/102w0bsn0ge83qfv7za/102/hls_vod_mvp.m3u8") else {return}
        player = AVPlayer(url: url)
        let playerPlayer = AVPlayerLayer(player: player)
        self.layer.addSublayer(playerPlayer)
        playerPlayer.frame = self.frame
        player?.play()
        player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
        

    }
    
    //MARK: OnTap button playvideo
    @objc func onTapPauseBtn(_sender: UIButton) {
        if isPlaying {
            player?.pause()
            pausePlayBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player?.play()
            pausePlayBtn.setImage(UIImage(systemName: "pause"), for: .normal)
        }
        isPlaying = !isPlaying
        print(isPlaying)
    }
    @objc func onChangeValueSlider() {
        if let duration = player?.currentItem?.duration {
            let totalSecond = CMTimeGetSeconds(duration)
            let value = Double(slider.value) * totalSecond
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            player?.seek(to: seekTime, completionHandler: { (handle) in
                
            })
        }
    }
    
    // when the videos is start so indicator hiden
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // khi video chay thi no se setup ui duoi nay
        if keyPath == "currentItem.loadedTimeRanges" {
            indicator.stopAnimating()
            contrainerV.backgroundColor = .clear
            isPlaying = true
            pausePlayBtn.isHidden = false
            
            //set up slider
            if let duration = player?.currentItem?.duration {
                let durationBySeconds = CMTimeGetSeconds(duration)
                let min = Int(durationBySeconds) / 60
                let secondsText = Int(durationBySeconds) % 60
                videoLenghtLb.text = "\(min):\(secondsText)"
            }
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class VideosLaucher: NSObject {
    func showVideo() {
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = .white
            keyWindow.addSubview(view)
//            let homeAuthor = HomeAuthorVC()
//            keyWindow.addSubview(homeAuthor.view)
//            homeAuthor.view.backgroundColor = .white
            let videoPlayerV = VideoPlayer(frame: .init(x: 0, y: 0, width: keyWindow.frame.width, height: keyWindow.frame.width * 9/16))
            keyWindow.addSubview(videoPlayerV)
            view.frame = .init(x: keyWindow.frame.minX, y: keyWindow.frame.maxY, width: keyWindow.frame.width, height: 0 )
//            homeAuthor.view.frame = .init(x: keyWindow.frame.minX, y: keyWindow.frame.maxY, width: keyWindow.frame.width, height: 0 )
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = keyWindow.frame
//                homeAuthor.view.frame = keyWindow.frame
            }) { (completed) in
                UIApplication.shared.setStatusBarHidden(true, with: .fade)
            }
        }
    }
}
