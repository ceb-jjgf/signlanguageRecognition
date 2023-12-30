import SwiftUI
import UIKit

struct CameraViewAdapter: UIViewControllerRepresentable {
    typealias UIViewControllerType = CameraViewController

    func makeUIViewController(context: Context) -> CameraViewController {
        // 创建并返回 CameraViewController 实例
        return CameraViewController()
    }
}
