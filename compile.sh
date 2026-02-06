#!/bin/bash
# 大连理工大学学位论文模板编译脚本
# 使用 XeLaTeX + biblatex + biber 编译

# 检查必要命令是否存在
if ! command -v xelatex &> /dev/null; then
    echo "错误: 未找到 xelatex 命令，请安装 TeX Live 或 MiKTeX"
    exit 1
fi

if ! command -v biber &> /dev/null; then
    echo "错误: 未找到 biber 命令，请安装 TeX Live 或 MiKTeX"
    exit 1
fi

echo "正在编译大连理工大学学位论文模板..."
echo "使用编译工具: XeLaTeX + biblatex + biber"
echo "================================================="

# 清理旧的编译文件
echo "清理旧的编译文件..."
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.lof *.lot *.run.xml

echo "步骤 1/4: 第一次 XeLaTeX 编译..."
xelatex -shell-escape -interaction=nonstopmode main.tex
if [ $? -ne 0 ]; then
    echo "第一次编译失败，请检查错误信息"
    exit 1
fi

echo "步骤 2/4: 运行 Biber 生成参考文献..."
biber main
if [ $? -ne 0 ]; then
    echo "Biber 处理失败，请检查参考文献格式"
    exit 1
fi

echo "步骤 3/4: 第二次 XeLaTeX 编译..."
xelatex -shell-escape -interaction=nonstopmode main.tex
if [ $? -ne 0 ]; then
    echo "第二次编译失败，请检查错误信息"
    exit 1
fi

echo "步骤 4/4: 第三次 XeLaTeX 编译..."
xelatex -shell-escape -interaction=nonstopmode main.tex
if [ $? -ne 0 ]; then
    echo "第三次编译失败，请检查错误信息"
    exit 1
fi

echo "================================================="
echo "编译完成！"
echo "生成的 PDF 文件: main.pdf"
echo "可以使用 PDF 阅读器打开查看结果"

# # 询问是否打开 PDF
# read -p "是否要打开生成的 PDF 文件？(y/n): " -n 1 -r
# echo
# if [[ $REPLY =~ ^[Yy]$ ]]; then
#     if command -v xdg-open &> /dev/null; then
#         xdg-open main.pdf
#     elif command -v open &> /dev/null; then
#         open main.pdf
#     else
#         echo "无法自动打开 PDF 文件，请手动打开 main.pdf"
#     fi
# fi
