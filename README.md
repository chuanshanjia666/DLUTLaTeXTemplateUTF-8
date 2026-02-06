# 大连理工大学学位论文 XeLaTeX 模板

这是一个基于 XeLaTeX 的大连理工大学学位论文模板，使用 `.cls` 文档类文件进行统一管理，支持 UTF-8 编码。

## 主要特性

- ✅ 使用 XeLaTeX 编译，完美支持中文
- ✅ 基于 `.cls` 文档类，配置集中管理
- ✅ 支持 UTF-8 编码
- ✅ 集成 biblatex + biber 参考文献管理
- ✅ 符合大连理工大学学位论文格式要求
- ✅ 自动化编译脚本

## 编译环境要求

- TeX Live 2020+ 或 MiKTeX 20.6+
- XeLaTeX
- biber (用于参考文献处理)

## 快速开始

### 方法一：使用编译脚本（推荐）

```bash
# 给编译脚本添加执行权限
chmod +x compile.sh

# 运行编译脚本
./compile.sh
```

### 方法二：手动编译

```bash
# 第一次编译
xelatex main.tex

# 处理参考文献
biber main

# 第二次编译
xelatex main.tex

# 第三次编译（确保交叉引用正确）
xelatex main.tex
```

## 文件结构

```
DLUTLaTeXTemplateUTF-8/
├── dlutthesis.cls          # 文档类文件（核心配置）
├── main.tex                # 主文件
├── compile.sh              # 编译脚本
├── body/                   # 正文内容
│   ├── chap00.tex         # 第0章
│   ├── chap01.tex         # 第1章
│   ├── chap02.tex         # 第2章
│   ├── chap03.tex         # 第3章
│   └── reference.bib      # 参考文献数据库
├── preface/               # 前言部分
│   └── cover.tex          # 封面信息
├── appendix/              # 附录
│   ├── chapA.tex          # 附录A
│   └── acknowledgements.tex # 致谢
└── figures/               # 图片目录（需要时创建）
```

## 自定义论文信息

在 `main.tex` 文件中设置论文基本信息：

```latex
% 论文信息设置
\ctitle{大连理工大学学位论文 \\ XeLaTeX 模板设计与实现}
\cdegree{硕士学位论文}
\cauthor{作者姓名}
\cauthorno{2020000000}
\csupervisor{导师姓名\quad 教授}
\csubject{专业名称}
\cschool{学院（学部）名称}
\creviewer{评阅教师}
\cdate{2024年6月}
\cabstract{
    这里是中文摘要内容...
}
\ckeywords{XeLaTeX；学位论文模板；文档类；自动化排版}

\etitle{Design and Implementation of XeLaTeX Template for Dalian University of Technology}
\eabstract{
    This is the English abstract...
}
\ekeywords{XeLaTeX; thesis template; document class; automated typesetting}
```

## 添加参考文献

在 `body/reference.bib` 文件中添加参考文献条目，然后在正文中引用：

```latex
% 在正文中引用
\cite{key1}

% 在参考文献章节前添加
\printbibliography[title=参考文献]
```

## 常见问题

### 1. 编译失败
- 确保已安装完整的 TeX Live 或 MiKTeX
- 检查是否安装了所有必要的宏包
- 查看编译日志中的具体错误信息

### 2. 字体问题
- 模板使用系统默认字体
- 如需自定义字体，可在 `dlutthesis.cls` 中修改相关设置

### 3. 参考文献格式
- 使用 biblatex + biber 方案，符合 GB/T 7714-2015 标准
- 确保 `.bib` 文件格式正确

## 版本历史

- v1.0 (2024-01-01): 初始版本，重构为 `.cls` 文档类格式

## 许可证

本项目遵循 LaTeX Project Public License (LPPL) 1.3c 版本。

## 联系方式

如有问题或建议，请发送邮件至：yuri_1985@163.com

---

**注意：** 使用前请根据学校最新要求检查模板格式是否符合规范。