import Cocoa
import FlutterMacOS

public class DesktopInfoPlugin: NSObject, FlutterPlugin {
    fileprivate let systemInfo = SystemInfo()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "desktop_info", binaryMessenger: registrar.messenger)
        let instance = DesktopInfoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getInfo":
            DispatchQueue.main.async {
                self.systemInfo.data(call,result)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}


final public class SystemInfo {
    
    final var TAG = "desktop_info"
    
    /// Returns the raw data of the user’s macos device.
    public func data(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        
        do{
            if let args = call.arguments as? Dictionary<String, Any>,
               let type = args["type"] as? String,
               let resultType = args["resultType"] as? String{
                
                /// create process task and a pipe to stream data to
                let task = Process()
                let outputPipe = Pipe()
                
                /// launch task
                task.launchPath = "/usr/sbin/system_profiler"
                task.arguments = ["-\(resultType)", "-detailLevel", type]
                task.standardOutput = outputPipe
                task.launch()
                
                /// handle output
                let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
                let output = NSString(data: outputData, encoding: String.Encoding.utf8.rawValue)! as String
                
                result(output)
            } else {
                result(FlutterError.init(code: TAG, message: nil, details: "type or resultType is missing"))
            }
        }
    }
}
