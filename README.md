# Sqltor5.3v

# 🛡️ SqlTor5.3 - SQLMap + Tor స్వయంచాలక స్కానర్ (తెలుగు)

ఈ స్క్రిప్ట్ మీకు **SQLMap** ద్వారా వెబ్‌సైట్లలో SQL Injection బలహీనతలు స్కాన్ చేయడానికి సహాయపడుతుంది. ప్రత్యేకత Tor Network ద్వారా **IP మాస్కింగ్ & ప్రైవసీ** కల్పిస్తుంది. ఈ స్క్రిప్ట్ Android లోని **Termux** లో పనిచేస్తుంది.

---

## 🧰 అవసరమైన టూల్స్
# ⚠️ గమనిక Sqltor5.3 PASSWORD 1234
### ✅ Termux లో ఇన్‌స్టాల్ చేయాల్సినవి:

```bash
pkg update && pkg upgrade -y
./install.sh
pkg install python git tor curl -y
chmod +x Sqltor5.3v.sh
bash Sqltor5.3v.sh
pip install -r requirements.txt
