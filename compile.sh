#!/bin/bash
clear

if [ -z "$1" ]; then
  echo "Erro: você precisa passar o nome do arquivo (sem a extensão)."
  exit 1
fi

# Cria arquivo .cpp se não existir
if [ ! -f "$1.cpp" ]; then
  cat > "$1.cpp" <<EOL
#include <bits/stdc++.h>
using namespace std;

#define int int64_t
#define dbg(v) cerr << "Line(" << __LINE__ << ") -> " << #v << " = " << (v) << "\n"

int32_t main() {
	ios::sync_with_stdio(false);
	cin.tie(nullptr);
	
	;
}
EOL
else
  echo "Arquivo $1.cpp já existe. Não será alterado."
fi

# Cria arquivo de entrada vazio se não existir
if [ ! -f "$1.in" ]; then
  touch "$1.in"
else
  echo "Arquivo $1.in já existe. Não será alterado."
fi

clear

# Compila o código, incluindo diretórios extras se precisar
g++ -I /mnt/c/Users/souza/OneDrive/Documentos/includes "$1.cpp" -o "$1"

# Mede o tempo de execução do programa
start=$(date +%s%N)
./"$1" < "$1.in" > "$1.out"
end=$(date +%s%N)

# Exibe saída do programa
cat "$1.out"

# Calcula duração em milissegundos
duration=$((end - start))
duration_ms=$((duration / 1000000))

# Calcula segundos e milissegundos com padding
seconds=$((duration_ms / 1000))
milliseconds=$((duration_ms % 1000))

# Padding para segundos com 2 dígitos (ex: 05)
if [ $seconds -lt 10 ]; then
  seconds_padded="0$seconds"
else
  seconds_padded=$seconds
fi

# Padding para milissegundos com 3 dígitos (ex: 023)
milliseconds_padded=$(printf "%03d" $milliseconds)

echo "Tempo de execução: ${seconds_padded}.${milliseconds_padded} s"

# Opcional: Remover arquivos gerados (descomentar se desejar)
# rm "$1.cpp" "$1" "$1.in" "$1.out"
