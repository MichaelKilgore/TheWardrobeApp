//
//  testView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/22/21.
//

import SwiftUI
import AVFoundation
 
struct CustomCameraPhotoView: View {
    @State private var image: Image?
    @State private var showingCustomCamera = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        
        NavigationView {
            VStack {
                ZStack {
                    Rectangle().fill(Color.secondary)
                    
                    if image != nil
                    {
                        image?
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    else
                    {
                        Text("Take Photo").foregroundColor(.white).font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingCustomCamera = true
                }
            }
            .sheet(isPresented: $showingCustomCamera, onDismiss: loadImage) {
                CustomCameraView(exitCameraView: .constant(true))
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}


struct CustomCameraView: View {
    // MARK: - PROPERTY
    
    @State var image: UIImage?
    @State var recoveredImage: UIImage?
    @State var didTapCapture: Bool = false
    @State var didTapCaptureTwo: Bool = false
    
    @Binding var exitCameraView: Bool
    
    @State var imageConfirmed: Bool = false
        
    // MARK: - FUNCTION
    
    // MARK: - BODY
    var body: some View {
        if (!didTapCaptureTwo || recoveredImage == nil) {
            ZStack(alignment: .bottom) {
                
                CustomCameraRepresentable(image: self.$image, didTapCapture: $didTapCapture, recoveredImage: $recoveredImage)
                //PhotoCaptureOverlayButton
                
                VStack(alignment: .leading) {
                    HStack {
                        if (didTapCapture == false) {
                            Text("x")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 15)
                                .onTapGesture {
                                    print("exiting camera view.")
                                    exitCameraView = false
                                }
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
                
                PhotoCaptureOverlayButton().onTapGesture {
                    recoveredImage = nil
                    self.didTapCapture = true
                    self.didTapCaptureTwo = true
                    print("Switch")
                    feedback.notificationOccurred(.success)
                }
            } //: ZSTACK
        } else if (imageConfirmed == false) {
            ZStack(alignment: .bottom) {
                Image(uiImage: recoveredImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                PictureWasTakenView(didTapCapture: $didTapCaptureTwo, imageConfirmed: $imageConfirmed, image: $recoveredImage)
            } //: ZSTACK
        } else {
            //final view
            //Passing default item() here, but we need the image too?
            NewWardrobeItemView(imageConfirmed: $imageConfirmed, image: recoveredImage!, exitCameraView: $exitCameraView)
        } //: CONDITIONAL
    } //: BODY
}


struct CustomCameraRepresentable: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    @Binding var didTapCapture: Bool
    @Binding var recoveredImage: UIImage?
    
    func makeUIViewController(context: Context) -> CustomCameraController {
        let controller = CustomCameraController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ cameraViewController: CustomCameraController, context: Context) {
        
        if(self.didTapCapture) {
            cameraViewController.didTapRecord()
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate {
        let parent: CustomCameraRepresentable
        
        init(_ parent: CustomCameraRepresentable) {
            self.parent = parent
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            
            parent.didTapCapture = false
            
            if let imageData = photo.fileDataRepresentation() {
                parent.image = UIImage(data: imageData)
                parent.recoveredImage = parent.image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

class CustomCameraController: UIViewController {
    
    var image: UIImage?
    
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    var photoOutput: AVCapturePhotoOutput?
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    //DELEGATE
    var delegate: AVCapturePhotoCaptureDelegate?
    
    func didTapRecord() {
        
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: delegate!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
    }
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    func setupDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera],
                                                                      mediaType: AVMediaType.video,
                                                                      position: AVCaptureDevice.Position.unspecified)
        for device in deviceDiscoverySession.devices {
            
            switch device.position {
            case AVCaptureDevice.Position.front:
                self.frontCamera = device
            case AVCaptureDevice.Position.back:
                self.backCamera = device
            default:
                break
            }
        }
        
        self.currentCamera = self.backCamera
    }
    
    
    func setupInputOutput() {
        do {
            
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
            
        } catch {
            print(error)
        }
        
    }
    func setupPreviewLayer()
    {
        self.cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        self.cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
        
    }
    func startRunningCaptureSession(){
        captureSession.startRunning()
    }
}
