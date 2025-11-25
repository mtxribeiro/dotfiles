# 🚀 Instalação Arch + Hyprland

## 📸 Preview  
Aqui você pode adicionar imagens do seu desktop para mostrar como fica depois da instalação:  
<img width="1919" height="1080" alt="image" src="https://github.com/user-attachments/assets/28e7456f-1886-4f5e-8f81-5aa38eec9f3f" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/6ef3b003-f758-4520-bba9-d524420e119a" />
---

## 📦 Dependências  
Para rodar o script de instalação é necessário ter:  
- fish → o script foi escrito para rodar nesse shell  
- git → para clonar este repositório  

Instale com:  
sudo pacman -S git fish  

---

## 🖥️ Drivers  
Os drivers não estão incluídos no script.  
Eles precisam ser instalados manualmente, pois variam de acordo com o hardware de cada computador (ex: NVIDIA, AMD, Intel).  

Consulte a Arch Wiki para detalhes:  
https://wiki.archlinux.org/title/Xorg#Driver_installation  

---

## ⚠️ Aviso  
O script pode sobrescrever seus arquivos de configuração.  
É altamente recomendado fazer um backup antes de rodar:  

cp -r ~/.config ~/.config-backup  

---

## ▶️ Como usar  
Clone o repositório e rode o script:  

git clone https://github.com/mtxribeiro/dotfiles.git ~/dotfiles  
cd ~/dotfiles  
fish install.fish  
