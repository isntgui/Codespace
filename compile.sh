# Exemplo de uso: sh ./compile.sh codigo
#!/bin/bash
clear

if [ -z "$1" ]; then
  echo "Erro: você precisa passar o nome do arquivo (sem a extensão)."
  exit 1
fi

if [ ! -f "$1.cpp" ]; then
  cat > "$1.cpp" <<EOL
#include <bits/stdc++.h>
using namespace std;

int main() {
	ios::sync_with_stdio(false);
	cin.tie(nullptr);

	// cod here...
	;
}
EOL
else
  echo "Arquivo $1.cpp já existe. Não será alterado."
fi

if [ ! -f "$1.in" ]; then
  cat > "$1.in" << EOL
EOL
else
  echo "Arquivo $1.in já existe. Não será alterado."
fi

g++ -o "$1.exe" "$1.cpp"
./"$1.exe" < "$1.in" > "$1.out"
cat "$1.out"

# Opcional: Remover os arquivos gerados (descomentar se desejar)
# rm "$1.cpp" "$1.exe" "$1.in" "$1.out"
