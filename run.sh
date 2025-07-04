#!/usr/bin/env bash
# sh ./compile.sh A (cpp, py, java) || rmv (remove)
# caso queira escrever menos, ex: run A (cpp ou rmv)
# execute isso no seu terminal:

# mkdir -p ~/.local/bin
# mv run ~/.local/bin/
# chmod +x ~/.local/bin/run
# export PATH="$HOME/.local/bin:$PATH"
# source ~/.bashrc
# se funcionou, agora só escreva: run A (criar, rodar ou remover)

# update
# nano ~/run
# mv ~/run ~/.local/bin/run
# chmod +x ~/.local/bin/run
# echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
# source ~/.bashrc

clear
clear

if [ -z "$1" ]; then
  echo "Erro: você precisa passar o nome do arquivo (sem extensão)."
  exit 1
fi

filename="$1"

if [ "$2" = "rmv" ]; then
  rm -f "$filename".* "$filename"
  echo "Arquivos de $filename removidos."
  exit 0
fi

if [ -z "$2" ]; then
  echo "Erro: você precisa especificar a linguagem (cpp, py ou java)."
  exit 1
fi

lang="$2"

[ -f "$filename.in" ] || touch "$filename.in"

case "$lang" in
  cpp)
    if [ ! -f "$filename.cpp" ]; then
      cat > "$filename.cpp" <<EOL
#include <bits/stdc++.h>
using namespace std;

#ifdef LOCAL
    #include "debugging.h"
#endif

#define int int64_t

int32_t main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    ;
}
EOL
    fi
    g++ -DLOCAL -I /mnt/c/Users/souza/OneDrive/Documentos/includes "$filename.cpp" -o "$filename"
    ;;
  py)
    if [ ! -f "$filename.py" ]; then
      cat > "$filename.py" <<EOL
def dbg(v, name=""):
    print(f"DEBUG: {name} = {v}", file=sys.stderr)

import sys

def main():
    data = sys.stdin.read()
    print(data)

if __name__ == "__main__":
    main()
EOL
    fi
    ;;
  java)
    class_name="$(echo "$filename" | sed -E 's/[^a-zA-Z0-9]/_/g')"
    if [ ! -f "$filename.java" ]; then
      cat > "$filename.java" <<EOL
import java.util.*;
public class $class_name {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
    }
}
EOL
    fi
    javac "$filename.java"
    ;;
  *)
    echo "Erro: linguagem inválida. Use 'cpp', 'py' ou 'java'."
    exit 1
    ;;
esac

clear

start=$(date +%s%N)

case "$lang" in
  cpp)
    ./"$filename" < "$filename.in" > "$filename.out"
    ;;
  py)
    python3 "$filename.py" < "$filename.in" > "$filename.out"
    ;;
  java)
    java "$class_name" < "$filename.in" > "$filename.out"
    ;;
esac

end=$(date +%s%N)

cat "$filename.out"

duration=$((end - start))
duration_ms=$((duration / 1000000))
seconds=$((duration_ms / 1000))
milliseconds=$((duration_ms % 1000))

seconds_padded=$(printf "%02d" $seconds)
milliseconds_padded=$(printf "%03d" $milliseconds)

echo "Tempo de execução: ${seconds_padded}.${milliseconds_padded} s"
