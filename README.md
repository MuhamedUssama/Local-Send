# LocalSend 🚀

Transfer files seamlessly and securely across your local network without internet connections or cloud servers. Built with **Flutter** for cross-platform support.

---

## ✨ Features

### 📡 Discovery & Connectivity
* 📁 **Local File Sharing** – Transfer files seamlessly between devices over the local network.
* 🔍 **Automatic Device Discovery** – Discover nearby devices automatically using mDNS (Network Service Discovery).
* 📷 **QR Code Pairing** – Connect devices quickly by scanning a QR code when automatic discovery isn't available.
* 🚀 **Zero-Configuration Experience** – Start sharing files without requiring cloud services or external servers.

### ⚡ Performance & Transfer Engine
* ⚡ **High-Speed File Transfer** – Transfer files efficiently using TCP socket communication.
* 📦 **Chunked File Streaming** – Send large files in chunks to minimize memory usage and improve stability.
* 📊 **Real-Time Transfer Progress** – Display upload/download progress, speed, and remaining time.
* 🔄 **Resume Interrupted Transfers** – Continue interrupted file transfers without restarting from the beginning.

### 💻 Platform & User Experience
* 🌐 **Cross-Platform Support** – Works across Android, iOS, Windows, and macOS from a single Flutter codebase.
* 📱 **Responsive UI** – Optimized layouts for both mobile and desktop experiences.
* 📂 **File System Integration** – Browse, select, save, and manage files across different platforms.
* 🖱️ **Drag & Drop Support (Desktop)** – Drag files directly into the application for instant sharing.
* 📋 **Clipboard & Text Sharing** – Share copied text and links between devices instantly.

### 🔐 Security, History & Insights
* 🔐 **Permission Handling** – Manage storage and network permissions according to each platform's requirements.
* 📜 **Transfer History** – Keep a history of previously transferred files.
* 📈 **Transfer Analytics** – View transfer statistics such as speed, duration, and file size with simple charts.

---

## 🛠️ Built With

- **Framework:** [Flutter](https://flutter.dev)
- **Language:** [Dart](https://dart.dev)
- **Protocol:** TCP Sockets & mDNS Discovery

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the Flutter SDK installed on your system:
- [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)

### Running the App

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MuhamedUssama/Local-Send.git
   cd Local-Send
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the project:**
   ```bash
   flutter run
   ```

