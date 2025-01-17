#!/bin/bash

# Cek apakah file ./build/soong/soong_ui.bash ada
if [ -f "./build/soong/soong_ui.bash" ]; then
  # Jika file ada, jalankan perintah soong_ui.bash dengan --make-mode
  echo "File soong_ui.bash ditemukan. Menjalankan perintah..."
  ./build/soong/soong_ui.bash --make-mode -j2 
else
  # Jika file tidak ada, beri tahu pengguna
  echo "File soong_ui.bash tidak ditemukan."
fi
