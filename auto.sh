#!/bin/bash

# 多语言翻译映射（键：文件名去掉扩展名后的部分，值：对应翻译"暂无归档"）
declare -A translations=(
  ["ar"]="لا توجد أرشيفات حالياً"
  ["bg-BG"]="Няма архиви в момента"
  ["ca-ES"]="No hi ha arxius ara mateix"
  ["cs-CZ"]="Žádné archivy momentálně"
  ["de-DE"]="Zurzeit keine Archive"
  ["el-GR"]="Δεν υπάρχουν αρχεία προς το παρόν"
  ["en"]="No archives yet"
  ["es-ES"]="Aún no hay archivos"
  ["fa-IR"]="هنوز هیچ بایگانی‌ای وجود ندارد"
  ["fi-FI"]="Ei arkistoja tällä hetkellä"
  ["fr-FR"]="Aucune archive pour le moment"
  ["hu-HU"]="Jelenleg nincsenek archívumok"
  ["id-ID"]="Belum ada arsip"
  ["it-IT"]="Nessun archivio ancora"
  ["ja-JP"]="まだアーカイブがありません"
  ["ko-KR"]="아직 아카이브가 없습니다"
  ["my-MM"]="သေးတင် သိမ်းဆည်းမှု မရှိပါ"
  ["nl-NL"]="Nog geen archieven"
  ["pt-BR"]="Ainda não há arquivos"
  ["ru-RU"]="Пока нет архивов"
  ["sl-SI"]="Trenutno ni arhivov"
  ["sv-SE"]="Inga arkiv ännu"
  ["th"]="ยังไม่มีอาร์คाइฟ"
  ["tr-TR"]="Henüz arşiv yok"
  ["uk-UA"]="Ще немає архівів"
  ["vi-VN"]="Chưa có lưu trữ"
  ["zh-CN"]="暂无归档"
  ["zh-TW"]="暫無歸檔"
)

# 遍历 _data/locales 下的指定 .yml 和 .yaml 文件
for ext in "yml" "yaml"; do
  for file in _data/locales/*.${ext}; do
    # 检查文件是否存在（防止通配符不匹配时的空文件）
    [[ -f "$file" ]] || continue

    # 提取“语言代码”（如 bg-BG.yml → bg-BG）
    lang_code=$(basename "$file" .${ext})

    # 检查当前语言是否有预定义的翻译
    if [[ -v translations[$lang_code] ]]; then
      translation="${translations[$lang_code]}"
      echo "正在处理: $file (语言: $lang_code) → 翻译: $translation"

      # 直接在文件末尾添加配置，使用固定缩进
      # 先添加一个空行分隔，然后添加archives配置
      # 替换原来的sed命令为以下内容
      printf "\narchives:\n  no_archives: \"$translation\"\n" >>"$file"
    else
      echo "警告: 语言 $lang_code 无对应翻译，跳过文件 $file"
    fi
  done
done

echo "=== 所有文件处理完成 ==="
