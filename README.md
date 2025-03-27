# 🔍 XSS Scanner  
![Python](https://img.shields.io/badge/Python-3.9%2B-blue?logo=python)  
![Bash](https://img.shields.io/badge/Bash-Scripting-green?logo=gnu-bash)  
![Geckodriver](https://img.shields.io/badge/Geckodriver-Firefox-orange?logo=firefox)  
![XSS](https://img.shields.io/badge/Security-XSS-red?logo=security)  

<video width="600" controls>
  <source src="https://github.com/infat0x/infat0xSS/blob/master/media/exampleUsage.mp4" type="video/mp4">
</video>



🔎 **A Simple XSS Detection Tool That Logs Pop-ups**  
This tool, built with **Python, Bash, and Geckodriver**, checks if a website is vulnerable to **XSS (Cross-Site Scripting)**. **If a pop-up appears, it logs the event.**  

## 📌 Features  
✅ **Lightweight & Fast**: Only checks for pop-ups, keeping scans efficient.  
✅ **Automatic Geckodriver Execution**: Uses Firefox for JavaScript rendering.  
✅ **Logging System**: Records detected pop-ups along with timestamps and URLs.  
✅ **Easy to Use**: Scan a single URL or a list of URLs with a simple command.  

## ⚙️ Installation  

### 1️⃣ Install Dependencies  
```bash
cd /home/$USER/Downloads
sudo git clone https://github.com/infat0x/infat0xSS.git
sudo chmod +x infat0xss.sh
```
##❗ If geckodriver doesn't work or is uninstalled: (IF NEED!)
```bash
wget https://github.com/mozilla/geckodriver/releases/latest/download/geckodriver-linux64.tar.gz
tar -xvzf geckodriver-linux64.tar.gz
sudo mv geckodriver /home/$USER/Downloads/infat0xSS/src/
```
## 📜 Usage
```bash
cd /home/$USER/Downloads
./infat0xSS.sh
```
