#!/bin/bash

# code --list-extensions --show-versions
# ./install-vscode-extensions-v2.sh
ARQUIVO_LISTA="extensoes-v2.txt"


get_latest_version() {
    local publisher="$1"
    local extension="$2"
    
    # Fetch the extension page and extract version
    curl -s "https://marketplace.visualstudio.com/items?itemName=${publisher}.${extension}" | 
        grep -o '"version":"[^"]*"' | 
        head -n1 | 
        cut -d'"' -f4
}

while IFS= read -r line; do
    # Remove espaços e caracteres de retorno de carro
    line=$(echo "$line" | tr -d '\r' | xargs)
    
    # Ignora linhas em branco ou comentários
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    # Separa em name@version
    IFS='@' read -r name version <<< "$line"
    
    # Separa name em publisher.extension
    IFS='.' read -r publisher extension <<< "$name"
    
    echo "Publisher: $publisher"
    echo "Extension: $extension"
    echo "Version: $version"

    # Se a versão for "latest", buscar a última versão disponível
    current_version=$(get_latest_version "$publisher" "$extension")
    echo "Versão atual obtida: $current_version"

    # Se as versões forem iguais, pular a instalação
    if [ "$version" == "$current_version" ]; then
        echo "A extensão $publisher.$extension já está na versão mais recente ($current_version). Pulando instalação."
        continue
    fi

     # Se a versão for "latest", usar a versão atual obtida
    if [ "$version" == "latest" ]; then
        version="$current_version"
        echo "Última versão detectada: $version"
    fi

    # Ex: 3.84.0
    # Se a current_version for maior que a versão especificada, usar a current_version
    if [ "$(printf '%s\n' "$current_version" "$version" | sort -V | tail -n1)" == "$current_version" ]; then
        version="$current_version"
        echo "Usando a versão mais recente: $version"
    fi



    
    # URL="https://${publisher}.gallerycdn.vsassets.io/extensions/${publisher}/${extension}/${version}/Microsoft.VisualStudio.Services.VSIXPackage"
    # URL="https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension}/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
    URL="https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extension}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
    # https://vscode-icons-team.gallery.vsassets.io/_apis/public/gallery/publisher/vscode-icons-team/extension/vscode-icons/12.15.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage?redirect=true
    # https://pkief.gallery.vsassets.io/_apis/public/gallery/publisher/PKief/extension/material-icon-theme/5.27.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage?redirect=true
    # https://pkief.gallery.vsassets.io/_apis/public/gallery/publisher/pkief/extension/material-icon-theme/5.24.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    
    # tocar os pontos da versao por - exemplo 1.2.3 -> 1-2-3
    clean_version=$(echo "$version" | tr '.' '-')
    
    FILENAME="${publisher}-${extension}-${clean_version}.vsix"

    echo "Baixando $FILENAME..."
    echo "URL: $URL"

    curl --silent --show-error --fail -X GET -o "$FILENAME" "$URL"

    code --install-extension "$FILENAME"
    if [ $? -eq 0 ]; then
        echo "Extensão $FILENAME instalada e removida."
    else
        echo "Falha ao instalar $FILENAME."
    fi
    rm "$FILENAME"
done < "$ARQUIVO_LISTA"