import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureFileOutputRecordingDelegate {
    var captureSession: AVCaptureSession?
    var videoOutput: AVCaptureMovieFileOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }

    func setupCamera() {
        // ... 省略初始化摄像头的代码 ...
    }

    func startRecording() {
        guard let videoOutput = videoOutput else { return }

        // 检查是否正在录制
        if videoOutput.isRecording {
            videoOutput.stopRecording()
        } else {
            // 设置视频保存的路径
            let filePath = NSTemporaryDirectory() + "tempVideo.mov"
            let fileURL = URL(fileURLWithPath: filePath)
            
            // 开始录制
            videoOutput.startRecording(to: fileURL, recordingDelegate: self)
        }
    }

    // AVCaptureFileOutputRecordingDelegate 的委托方法
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            // 处理录制过程中的错误
            print("Error recording movie: \(error.localizedDescription)")
        } else {
            // 录制完成，处理视频文件
            // 比如上传到服务器
            VideoUploader().uploadVideo(outputFileURL) { response in
                print("服务器响应: \(response)")
            }
        }
    }

    // 其他必要的方法
}
