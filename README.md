# 🛠️ AutoHotkey v2.0 Utility Script

This AutoHotkey v2.0 script brings together a set of useful shortcuts for everyday use on Windows, such as quick searches, Explorer navigation, Spotify controls, and more. It’s especially useful for increasing productivity with simple hotkeys.

> ⚠️ **Requirements:** AutoHotkey v2.0 installed on the system.  
> ⚠️ Make sure to adjust program paths like Chrome and Everything according to your setup.

---

## 📂 Script Structure

### 🧭 **1. Go Up in Explorer with Mouse Click** — _by: Plankoe_

**Hotkey:** Middle mouse button click (scroll wheel)  
**Function:** When clicking with the middle button on an empty area of Windows Explorer, it goes up one folder level (`Alt+Up`).

- Uses accessibility functions to detect whether the click was on an empty area.

---

### 🔍 **2. Search with Everything** — _by: Onurtag_

**Hotkey:** `Alt+E`  
**Function:** Opens Everything using the path of the current folder or Desktop, depending on the context:

- **Explorer:** Opens Everything in the current folder (if valid).
- Everything path configured here:

  ```ahk
  EverythingPath := "C:\Program Files\Everything 1.5a\Everything64.exe"

---

### 🔠 **3. Capitalize After Punctuation** — _by: GroggyOtter_

**Hotkey:** `Space`  
**Function:** After typing `.`, `!`, or `?` followed by a space, the next typed letter will automatically be capitalized.

---

### 🗑️ **4. Empty Recycle Bin** — _by: EvenAngelsNeed_

**Hotkey:** `Ctrl+Alt+L`  
**Function:** Automatically empties the Windows Recycle Bin only if it is not already empty.

---

### 🎵 **5. Spotify Controls** — _by: CompetitiveTax_

**Function:** Allows control of Spotify playback through hotkeys. Even if the Spotify window is not active, commands work if Spotify Desktop is running.  
**Hotkeys:**

- `Ctrl + Alt + ← →`: Previous/Next track  
- `Ctrl + Alt + Space`: Play/Pause  
