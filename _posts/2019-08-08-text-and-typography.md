---
title: 文本与排版
description: 文本、排版、数学公式、图表、流程图、图片、视频等示例。
author: cotes
date: 2019-08-08 11:33:00 +0800
categories: [博客, 演示]
tags: [排版]
pin: true
math: true
mermaid: true
image:
  path: /commons/devices-mockup.png
  lqip: data:image/webp;base64,UklGRpoAAABXRUJQVlA4WAoAAAAQAAAADwAABwAAQUxQSDIAAAARL0AmbZurmr57yyIiqE8oiG0bejIYEQTgqiDA9vqnsUSI6H+oAERp2HZ65qP/VIAWAFZQOCBCAAAA8AEAnQEqEAAIAAVAfCWkAALp8sF8rgRgAP7o9FDvMCkMde9PK7euH5M1m6VWoDXf2FkP3BqV0ZYbO6NA/VFIAAAA
  alt: Chirpy主题在多设备上的响应式渲染效果。
---

## 标题

<!-- markdownlint-capture -->
<!-- markdownlint-disable -->
# H1 — 标题
{: .mt-4 .mb-0 }

## H2 — 标题
{: data-toc-skip='' .mt-4 .mb-0 }

### H3 — 标题
{: data-toc-skip='' .mt-4 .mb-0 }

#### H4 — 标题
{: data-toc-skip='' .mt-4 }
<!-- markdownlint-restore -->

## 段落

Quisque egestas convallis ipsum, ut sollicitudin risus tincidunt a. Maecenas interdum malesuada egestas. Duis consectetur porta risus, sit amet vulputate urna facilisis ac. Phasellus semper dui non purus ultrices sodales. Aliquam ante lorem, ornare a feugiat ac, finibus nec mauris. Vivamus ut tristique nisi. Sed vel leo vulputate, efficitur risus non, posuere mi. Nullam tincidunt bibendum rutrum. Proin commodo ornare sapien. Vivamus interdum diam sed sapien blandit, sit amet aliquam risus mattis. Nullam arcu turpis, mollis quis laoreet at, placerat id nibh. Suspendisse venenatis eros eros.

（注：此处为保持原文示例的完整性，保留了拉丁文段落，实际使用中可替换为中文内容）

## 列表

### 有序列表

1. 第一
2. 第二
3. 第三

### 无序列表

- 章节
  - 小节
    - 段落

### 待办列表

- [ ] 工作
  - [x] 步骤1
  - [x] 步骤2
  - [ ] 步骤3

### 描述列表

太阳
: 地球绕其运行的恒星

月亮
: 地球的天然卫星，通过反射太阳光可见

## 块引用

> 此行展示了_块引用_。

## 提示框

<!-- markdownlint-capture -->
<!-- markdownlint-disable -->
> 展示`tip`类型提示框的示例。
{: .prompt-tip }

> 展示`info`类型提示框的示例。
{: .prompt-info }

> 展示`warning`类型提示框的示例。
{: .prompt-warning }

> 展示`danger`类型提示框的示例。
{: .prompt-danger }
<!-- markdownlint-restore -->

## 表格

| 公司名称                     | 联系人           |   国家 |
| :--------------------------- | :--------------- | -----: |
| Alfreds Futterkiste          | Maria Anders     |   德国 |
| Island Trading               | Helen Bennett    |   英国 |
| Magazzini Alimentari Riuniti | Giovanni Rovelli | 意大利 |

## 链接

<http://127.0.0.1:4000>

## 脚注

点击钩子将定位到脚注[^footnote]，这里还有另一个脚注[^fn-nth-2]。

## 行内代码

这是`行内代码`的示例。

## 文件路径

这里是`/path/to/the/file.extend`{: .filepath}。

## 代码块

### 普通代码块

```text
这是一个普通的代码片段，没有语法高亮和行号。
```

### 特定语言代码块

```bash
if [ $? -ne 0 ]; then
  echo "命令执行失败。";
  #执行必要操作/退出
fi;
```

### 特定文件名代码块

```sass
@import
  "colors/light-typography",
  "colors/dark-typography";
```
{: file='_sass/jekyll-theme-chirpy.scss'}

## 数学公式

由[**MathJax**](https://www.mathjax.org/)提供支持的数学公式：

$$
\begin{equation}
  \sum_{n=1}^\infty 1/n^2 = \frac{\pi^2}{6}
  \label{eq:series}
\end{equation}
$$

我们可以引用该公式为 \eqref{eq:series}。

当 $a \ne 0$ 时，方程 $ax^2 + bx + c = 0$ 有两个解，分别是

$$ x = {-b \pm \sqrt{b^2-4ac} \over 2a} $$

## Mermaid 图表

```mermaid
 gantt
  title 为mermaid添加甘特图功能
  apple :a, 2017-07-20, 1w
  banana :crit, b, 2017-07-23, 1d
  cherry :active, c, after b a, 1d
```

## 图片

### 默认（带标题）

![桌面视图](/posts/20190808/mockup.png){: width="972" height="589" }
_全屏宽度且居中对齐_

### 左对齐

![桌面视图](/posts/20190808/mockup.png){: width="972" height="589" .w-75 .normal}

### 左浮动

![桌面视图](/posts/20190808/mockup.png){: width="972" height="589" .w-50 .left}
Praesent maximus aliquam sapien. Sed vel neque in dolor pulvinar auctor. Maecenas pharetra, sem sit amet interdum posuere, tellus lacus eleifend magna, ac lobortis felis ipsum id sapien. Proin ornare rutrum metus, ac convallis diam volutpat sit amet. Phasellus volutpat, elit sit amet tincidunt mollis, felis mi scelerisque mauris, ut facilisis leo magna accumsan sapien. In rutrum vehicula nisl eget tempor. Nullam maximus ullamcorper libero non maximus. Integer ultricies velit id convallis varius. Praesent eu nisl eu urna finibus ultrices id nec ex. Mauris ac mattis quam. Fusce aliquam est nec sapien bibendum, vitae malesuada ligula condimentum.

（注：此处为保持原文示例的完整性，保留了拉丁文段落，实际使用中可替换为中文内容）

### 右浮动

![桌面视图](/posts/20190808/mockup.png){: width="972" height="589" .w-50 .right}
Praesent maximus aliquam sapien. Sed vel neque in dolor pulvinar auctor. Maecenas pharetra, sem sit amet interdum posuere, tellus lacus eleifend magna, ac lobortis felis ipsum id sapien. Proin ornare rutrum metus, ac convallis diam volutpat sit amet. Phasellus volutpat, elit sit amet tincidunt mollis, felis mi scelerisque mauris, ut facilisis leo magna accumsan sapien. In rutrum vehicula nisl eget tempor. Nullam maximus ullamcorper libero non maximus. Integer ultricies velit id convallis varius. Praesent eu nisl eu urna finibus ultrices id nec ex. Mauris ac mattis quam. Fusce aliquam est nec sapien bibendum, vitae malesuada ligula condimentum.

（注：此处为保持原文示例的完整性，保留了拉丁文段落，实际使用中可替换为中文内容）

### 深色/浅色模式与阴影

下方图片将根据主题偏好切换深色/浅色模式，注意它带有阴影。

![仅浅色模式](/posts/20190808/devtools-light.png){: .light .w-75 .shadow .rounded-10 w='1212' h='668' }
![仅深色模式](/posts/20190808/devtools-dark.png){: .dark .w-75 .shadow .rounded-10 w='1212' h='668' }

## 视频

{% include embed/youtube.html id='Balreaj8Yqs' %}

## 反向脚注

[^footnote]: 脚注来源
[^fn-nth-2]: 第二个脚注来源
