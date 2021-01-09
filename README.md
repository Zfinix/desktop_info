# Desktop Info

Desktop Info is a plugin to get on device information from desktop OS environments, currently only **MacOS** is Support, feel free to make PRs for others. 

### 🚀 Usage

```dart
  
   String data = await MacOSInfo.systemInfo(
            resultType: MacOSInfoResultType.json, //return as JSON
            type: MacOSInfoType.basic // return Basic data
        );

   print(data);
   
```
- resultType can either be json/xml
- type can either be basic, or mini 


## 🤔 MacOS setup
You might need to add the following to `Release.entitlements` file.
```xml
    <key>com.apple.security.device.audio-input</key>
	<true/>
	<key>com.apple.security.device.bluetooth</key>
	<true/>
	<key>com.apple.security.device.camera</key>
	<true/>
	<key>com.apple.security.device.usb</key>
	<true/>
	<key>com.apple.security.network.client</key>
	<true/>
	<key>com.apple.security.network.server</key>
  }
```
or just check as follows 

<p float="left">
<img src="https://github.com/Zfinix/desktop_info/blob/main/meta/img.png?raw=true" width="300">
</p>



## ✨ Contribution
 Lots of PR's would be needed to improve this plugin. Suggestions and PRs are highly welcome.
