# 🛠️ AutoHotkey v2.0 Utility Script

Este script em AutoHotkey v2.0 reúne uma série de atalhos úteis para o dia a dia no Windows, como buscas rápidas, navegação no Explorer, controle do Spotify e mais. É especialmente útil para aumentar produtividade com teclas de atalho simples.

> ⚠️ **Requisitos:** AutoHotkey v2.0 instalado no sistema.  
> ⚠️ Certifique-se de ajustar os caminhos de programas como Chrome e Everything conforme a sua instalação.

---

## 📂 Estrutura do Script

### 🔗 **1. Buscar no Navegador** — _por: GorvGoyl_

**Atalho:** `Alt+B`  
**Função:** Pesquisa o texto selecionado no Google. Se for um link simples (ex: `example.com`), abre diretamente no Chrome.

- Copia automaticamente o texto selecionado.
- Codifica corretamente caracteres como `#`, `&`, `+`, `"`, etc.
- Abre no Chrome: `C:\Program Files\Google\Chrome\Application\chrome.exe` pode-se configurar outro navegador

---

### 🧭 **2. Voltar no Explorer com Clique do Mouse** — _por: u/plankoe_

**Atalho:** Clique com botão do meio do mouse (scroll)  
**Função:** Ao clicar com o botão do meio em uma área vazia do Explorer, sobe para a pasta anterior (`Alt+Up`).

- Usa funções de acessibilidade para detectar se o clique foi em uma área vazia.

---

### 🔍 **3. Pesquisa com Everything** — _por: Onurtag_

**Atalho:** `Alt+E`  
**Função:** Abre o Everything com o caminho da pasta ativa ou área de trabalho, dependendo do contexto:

- **Área de Trabalho / Desktop / Tray:** Abre o Everything com o Desktop como pasta inicial.
- **Explorer:** Abre o Everything na pasta atual (se válida).
- Caminho do Everything configurado em:

  ```ahk
  EverythingPath := "C:\Program Files\Everything 1.5a\Everything64.exe"

---

### 🔠 **4. Capitalizar Após Pontuação** — _por: GroggyOtter_

**Atalho:** `Space`  
**Função:** Após digitar `.`, `!` ou `?` seguido de espaço, a próxima letra digitada será automaticamente convertida para maiúscula.

---

### 🗑️ **5. Esvaziar Lixeira** — _por: EvenAngelsNeed_

**Atalho:** `Ctrl+Alt+L`  
**Função:** Esvazia a Lixeira do Windows automaticamente, apenas se ela não estiver vazia.

---

### 🤖 **6. Conversar com o Chat GPT** — _por: Samuel_

**Atalho:** `Alt+G`  
**Função:** Copia o texto selecionado e abre o site do ChatGPT (`https://chatgpt.com/`) colando automaticamente o conteúdo.

---

### 🌐 **7. Buscar tradução no Google Translate** — _por: Bceenaeiklmr_

**Atalho:** `Alt+T`  
**Função:** Copia o texto selecionado e abre automaticamente o Google Translate, com a tradução configurada do idioma detectado (auto) para português (pt).
