//
//  PuttyViewController.swift
//  JuegoMovilesiOS
//
//  Created by Diego Farfán on 3/12/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation
import MobileCoreServices

class PuttyViewController: UIViewController, AVAudioRecorderDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var motionManager: CMMotionManager = CMMotionManager()
    var recorder: AVAudioRecorder?
    var timer: Timer!
    var isRecording: Bool = false
    
    @IBOutlet weak var textAcelerometro: UITextView!
    @IBOutlet weak var textMicrofono: UITextView!
    @IBOutlet weak var botonMicrofono: UIButton!
    @IBOutlet weak var imagenSensorLuz: UIImageView!
    
    @IBAction func botonAcelerometro(_ sender: Any) {
        if let acceletometerData = motionManager.accelerometerData {
            textAcelerometro.text = "X: " +
                String(acceletometerData.acceleration.x) + "\nY: " +
                String(acceletometerData.acceleration.x) + "\nZ: " +
                String(acceletometerData.acceleration.x)
        }
    }
    
    @IBAction func botonMicrofono(_ sender: Any) {
        if !isRecording {
            botonMicrofono.setTitle("Parar Recolección", for: .normal)
            isRecording = true
            initRecording()
        } else {
            botonMicrofono.setTitle("Iniciar Recolección", for: .normal)
            isRecording = false
            finishRecording()
        }
    }
    
    @IBAction func botonSensorLuz(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        self.dismiss(animated: true, completion: nil)
        if mediaType.isEqual(to: kUTTypeImage as String) {
            let image = info[UIImagePickerControllerOriginalImage]
                as! UIImage
            imagenSensorLuz.image = image
        } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initRecording() {
        askPermission()
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
            try session.setActive(true)
            
            let recordSettings = [
                AVFormatIDKey: Int(kAudioFormatAppleIMA4),
                AVSampleRateKey: 44100,
                AVNumberOfChannelsKey: 2,
                AVLinearPCMBitDepthKey: 16,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.caf")
            
            recorder = try AVAudioRecorder(url: audioFilename, settings: recordSettings)
            recorder?.delegate = self
            recorder?.isMeteringEnabled = true
            recorder?.record()
            print("Recording")
            self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(getDecibels), userInfo: nil, repeats: true)
        }
        catch {
            print("error")
        }
    }
    
    func askPermission() {
        AVAudioSession.sharedInstance().requestRecordPermission () {
            [] allowed in
            if allowed {
                print("Microphone allowed")
            } else {
                print("Denied")
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func finishRecording() {
        recorder?.stop()
        timer.invalidate()
    }
    
    func getDecibels() {
        recorder?.updateMeters()
        let value: Float = recorder!.averagePower(forChannel: 0)
        textMicrofono.text = String(value) + ", " + String(textMicrofono.text)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
