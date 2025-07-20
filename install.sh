#!/data/data/com.termux/files/usr/bin/bash

echo -e "\n🔧 Starting dependencies installation..."

# ✅ Update and install system packages
pkg update -y && pkg install git python curl tor tsu -y

# ✅ Upgrade pip
pip install --upgrade pip

# ✅ Install from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "📄 Found requirements.txt. Installing listed packages..."
    while IFS= read -r package || [ -n "$package" ]; do
        if [[ ! -z "$package" ]]; then
            echo "🔄 Installing: $package"
            pip install --upgrade "$package" 2>/dev/null || pkg install "$package" -y
        fi
    done < "requirements.txt"
    echo "✅ All Python & system packages installed."
else
    echo "❌ requirements.txt not found!"
fi

# ✅ Install sqlmap from GitHub if not already present
if [ ! -d "$HOME/sqlmap" ]; then
    echo "📥 Cloning sqlmap from GitHub..."
    git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git ~/sqlmap
else
    echo "📁 sqlmap already exists in ~/sqlmap"
fi

# ✅ Add alias to .bashrc if not already added
if ! grep -q "alias sqlmap=" ~/.bashrc; then
    echo "🔧 Adding sqlmap alias to .bashrc"
    echo "alias sqlmap='python3 ~/sqlmap/sqlmap.py'" >> ~/.bashrc
    source ~/.bashrc
else
    echo "🔁 sqlmap alias already exists in ~/.bashrc"
fi

# ✅ Test sqlmap
echo -e "\n🚀 Testing sqlmap command..."
sqlmap --version || echo "❗ Please restart Termux or run: source ~/.bashrc"

echo -e "\n✅ Setup Complete."
