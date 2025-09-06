---
title: 撰写新文章
author: cotes
date: 2019-08-08 14:10:00 +0800
categories: [博客, 教程]
tags: [写作]
render_with_liquid: false
---

本教程将指导你如何在Chirpy模板中撰写文章，即使你之前使用过Jekyll，也值得一读，因为许多功能需要设置特定的变量。

## 命名与路径

创建一个名为`YYYY-MM-DD-TITLE.EXTENSION`{: .filepath}的新文件，并将其放在根目录的`_posts`{: .filepath}文件夹中。请注意，`EXTENSION`{: .filepath}必须是`md`{: .filepath}或`markdown`{: .filepath}中的一个。如果你想节省创建文件的时间，可以考虑使用插件`Jekyll-Compose`（https://github.com/jekyll/jekyll-compose）来完成。

## 前置信息（Front Matter）

基本上，你需要在文章顶部填写如下的[前置信息](https://jekyllrb.com/docs/front-matter/)：

```yaml
---
title: 标题
date: 年-月-日 时:分:秒 +/-时区
categories: [主分类, 子分类]
tags: [标签]     # 标签名称应始终为小写
---
```

> 文章的布局默认已设置为`post`，因此无需在前置信息块中添加`layout`变量。
{: .prompt-tip }

### 日期的时区

为了准确记录文章的发布日期，你不仅要在`_config.yml`{: .filepath}中设置`timezone`，还要在文章前置信息的`date`变量中提供文章的时区。格式：`+/-TTTT`，例如`+0800`。

### 分类与标签

每篇文章的`categories`最多包含两个元素，而`tags`中的元素数量可以从0到无限。例如：

```yaml
---
categories: [动物, 昆虫]
tags: [蜜蜂]
---
```

### 作者信息

文章的作者信息通常不需要填写在前置信息中，默认情况下，它们会从配置文件的`social.name`和`social.links`的第一个条目获取。但你也可以按如下方式覆盖默认设置：

在`_data/authors.yml`中添加作者信息（如果你的网站没有这个文件，尽管创建一个）。

```yaml
<作者ID>:
  name: <全名>
  twitter: <作者的推特账号>
  url: <作者的主页>
```
{: file="_data/authors.yml" }

然后使用`author`指定单个作者，或使用`authors`指定多个作者：

```yaml
---
author: <作者ID>                     # 单个作者
# 或者
authors: [<作者1ID>, <作者2ID>]   # 多个作者
---
```

话虽如此，`author`键也可以指定多个作者。

> 从`_data/authors.yml`{: .filepath }文件中读取作者信息的好处是，页面会有`twitter:creator`元标签，这丰富了[Twitter卡片](https://developer.twitter.com/en/docs/twitter-for-websites/cards/guides/getting-started#card-and-content-attribution)，对SEO有好处。
{: .prompt-info }

### 文章描述

默认情况下，文章的开头文字会用于在首页的文章列表、“进一步阅读”部分以及RSS订阅的XML中显示。如果你不想显示自动生成的文章描述，可以在前置信息中使用`description`字段自定义：

```yaml
---
description: 文章的简短摘要。
---
```

此外，`description`文本也会显示在文章页面的标题下方。

## 目录（TOC）

默认情况下，目录（TOC）会显示在文章的右侧面板。如果你想全局关闭它，请到`_config.yml`{: .filepath}中，将`toc`变量的值设置为`false`。如果你想为特定文章关闭目录，在文章的[前置信息](https://jekyllrb.com/docs/front-matter/)中添加以下内容：

```yaml
---
toc: false
---
```

## 评论

评论的全局设置由`_config.yml`{: .filepath}文件中的`comments.provider`选项定义。一旦为该变量选择了评论系统，所有文章都会启用评论功能。

如果你想为特定文章关闭评论，在文章的前置信息中添加以下内容：

```yaml
---
comments: false
---
```

## 媒体

在Chirpy中，我们将图片、音频和视频称为媒体资源。

### URL前缀

有时我们不得不为一篇文章中的多个资源定义重复的URL前缀，这是一项枯燥的任务，你可以通过设置两个参数来避免。

- 如果你使用CDN托管媒体文件，可以在`_config.yml`{: .filepath }中指定`cdn`。然后，网站头像和文章的媒体资源URL会以CDN域名作为前缀。

  ```yaml
  cdn: https://cdn.com
  ```
  {: file='_config.yml' .nolineno }

- 要为当前文章/页面范围指定资源路径前缀，在文章的前置信息中设置`media_subpath`：

  ```yaml
  ---
  media_subpath: /path/to/media/
  ---
  ```
  {: .nolineno }

`site.cdn`和`page.media_subpath`选项可以单独使用或组合使用，灵活组成最终的资源URL：`[site.cdn/][page.media_subpath/]file.ext`

### 图片

#### 标题

在图片的下一行添加斜体文字，它将成为标题并显示在图片底部：

```markdown
![图片描述](/path/to/image)
_图片标题_
```
{: .nolineno}

#### 尺寸

为了防止图片加载时页面内容布局偏移，我们应该为每张图片设置宽度和高度。

```markdown
![桌面视图](/assets/img/sample/mockup.png){: width="700" height="400" }
```
{: .nolineno}

> 对于SVG图片，你至少要指定其宽度，否则它不会被渲染。
{: .prompt-info }

从Chirpy v5.0.0开始，`height`和`width`支持缩写（`height`→`h`，`width`→`w`）。以下示例与上面的效果相同：

```markdown
![桌面视图](/assets/img/sample/mockup.png){: w="700" h="400" }
```
{: .nolineno}

#### 位置

默认情况下，图片是居中的，但你可以使用`normal`、`left`和`right`中的一个类来指定位置。

> 一旦指定了位置，就不应添加图片标题。
{: .prompt-warning }

- **正常位置**

  以下示例中图片将左对齐：

  ```markdown
  ![桌面视图](/assets/img/sample/mockup.png){: .normal }
  ```
  {: .nolineno}

- **左浮动**

  ```markdown
  ![桌面视图](/assets/img/sample/mockup.png){: .left }
  ```
  {: .nolineno}

- **右浮动**

  ```markdown
  ![桌面视图](/assets/img/sample/mockup.png){: .right }
  ```
  {: .nolineno}

#### 深色/浅色模式

你可以让图片跟随深色/浅色主题偏好显示。这需要你准备两张图片，一张用于深色模式，一张用于浅色模式，然后为它们分配特定的类（`dark`或`light`）：

```markdown
![仅浅色模式](/path/to/light-mode.png){: .light }
![仅深色模式](/path/to/dark-mode.png){: .dark }
```

#### 阴影

程序窗口的截图可以考虑显示阴影效果：

```markdown
![桌面视图](/assets/img/sample/mockup.png){: .shadow }
```
{: .nolineno}

#### 预览图片

如果你想在文章顶部添加一张图片，请提供分辨率为1200 x 630的图片。请注意，如果图片的宽高比不符合1.91:1，图片将被缩放和裁剪。

了解这些前提条件后，你可以开始设置图片的属性：

```yaml
---
image:
  path: /path/to/image
  alt: 图片替代文本
---
```

注意，[`media_subpath`](#url前缀)也可以应用于预览图片，也就是说，当它被设置后，`path`属性只需要图片文件名。

为了简单使用，你也可以直接使用`image`来定义路径。

```yml
---
image: /path/to/image
---
```

#### LQIP（低质量图像占位符）

对于预览图片：

```yaml
---
image:
  lqip: /path/to/lqip-file # 或base64 URI
---
```

> 你可以在文章`[文本和排版](../text-and-typography/)`的预览图片中观察到LQIP。

对于普通图片：

```markdown
![图片描述](/path/to/image){: lqip="/path/to/lqip-file" }
```
{: .nolineno }

### 视频

#### 社交媒体平台

你可以使用以下语法嵌入来自社交媒体平台的视频：

```liquid
{% include embed/{平台名}.html id='{ID}' %}
```

其中`平台名`是平台名称的小写形式，`ID`是视频ID。

以下表格展示了如何从给定的视频URL中获取我们需要的两个参数，你也可以了解当前支持的视频平台。

| 视频URL                                                                                        | 平台       | ID             |
| ---------------------------------------------------------------------------------------------- | ---------- | :------------- |
| [https://www.`youtube`.com/watch?v=`H-B46URT4mg`](https://www.youtube.com/watch?v=H-B46URT4mg) | `youtube`  | `H-B46URT4mg`  |
| [https://www.`twitch`.tv/videos/`1634779211`](https://www.twitch.tv/videos/1634779211)         | `twitch`   | `1634779211`   |
| [https://www.`bilibili`.com/video/`BV1Q44y1B7Wf`](https://www.bilibili.com/video/BV1Q44y1B7Wf) | `bilibili` | `BV1Q44y1B7Wf` |

#### 视频文件

如果你想直接嵌入视频文件，使用以下语法：

```liquid
{% include embed/video.html src='{URL}' %}
```

其中`URL`是视频文件的URL，例如`/path/to/sample/video.mp4`。

你也可以为嵌入的视频文件指定额外的属性。以下是允许的所有属性列表。

- `poster='/path/to/poster.png'`——视频下载时显示的海报图片
- `title='文本'`——显示在视频下方的标题，与图片的标题样式相同
- `autoplay=true`——视频一旦可以播放就自动开始播放
- `loop=true`——视频到达结尾时自动回到开头
- `muted=true`——音频初始为静音状态
- `types`——指定其他视频格式的扩展名，用`|`分隔。确保这些文件与你的主视频文件在同一目录中。

考虑一个使用上述所有属性的示例：

```liquid
{%
  include embed/video.html
  src='/path/to/video.mp4'
  types='ogg|mov'
  poster='poster.png'
  title='演示视频'
  autoplay=true
  loop=true
  muted=true
%}
```

### 音频

如果你想直接嵌入音频文件，使用以下语法：

```liquid
{% include embed/audio.html src='{URL}' %}
```

其中`URL`是音频文件的URL，例如`/path/to/audio.mp3`。

你也可以为嵌入的音频文件指定额外的属性。以下是允许的所有属性列表。

- `title='文本'`——显示在音频下方的标题，与图片的标题样式相同
- `types`——指定其他音频格式的扩展名，用`|`分隔。确保这些文件与你的主音频文件在同一目录中。

考虑一个使用上述所有属性的示例：

```liquid
{%
  include embed/audio.html
  src='/path/to/audio.mp3'
  types='ogg|wav|aac'
  title='演示音频'
%}
```

## 置顶文章

你可以将一篇或多篇文章置顶在首页顶部，置顶的文章会按照发布日期的倒序排列。通过以下方式启用：

```yaml
---
pin: true
---
```

## 提示框

有几种类型的提示框：`tip`、`info`、`warning`和`danger`。它们可以通过向块引用添加`prompt-{类型}`类来生成。例如，定义一个`info`类型的提示框如下：

```md
> 提示框的示例行。
{: .prompt-info }
```
{: .nolineno }

## 语法

### 行内代码

```md
`行内代码部分`
```
{: .nolineno }

### 文件路径高亮

```md
`/path/to/a/file.extend`{: .filepath}
```
{: .nolineno }

### 代码块

Markdown符号````可以轻松创建代码块，如下所示：

```md
```
这是一个纯文本代码片段。
```
```

#### 指定语言

使用```{语言}`可以得到带有语法高亮的代码块：

```markdown
```yaml
key: value
```
```

> Jekyll标签`{% highlight %}`与本主题不兼容。
{: .prompt-danger }

#### 行号

默认情况下，除了`plaintext`、`console`和`terminal`之外的所有语言都会显示行号。当你想隐藏代码块的行号时，向其添加`nolineno`类：

```markdown
```shell
echo '不再显示行号！'
```
{: .nolineno }
```

#### 指定文件名

你可能已经注意到，代码块的顶部会显示代码语言。如果你想用文件名替换它，可以添加`file`属性来实现：

```markdown
```shell
# 内容
```
{: file="path/to/file" }
```

#### Liquid代码

如果你想显示Liquid代码片段，用`{% raw %}`和`{% endraw %}`包围Liquid代码：

```markdown
{% raw %}
```liquid
{% if product.title contains 'Pack' %}
  该产品的标题包含“Pack”一词。
{% endif %}
```
{% endraw %}
```

或者在文章的YAML块中添加`render_with_liquid: false`（需要Jekyll 4.0或更高版本）。

## 数学公式

我们使用[MathJax][mathjax]来生成数学公式。出于网站性能考虑，数学功能不会默认加载。但可以通过以下方式启用：

[mathjax]: https://www.mathjax.org/

```yaml
---
math: true
---
```

启用数学功能后，你可以使用以下语法添加数学公式：

- **块级数学公式**应使用`$$ 数学公式 $$`添加，且`$$`前后必须有空白行
  - **插入公式编号**应使用`$$\begin{equation} 数学公式 \end{equation}$$`添加
  - **引用公式编号**应在公式块中使用`\label{eq:标签名}`，并在文本中使用`\eqref{eq:标签名}`（见下面的示例）
- **行内数学公式**（在段落中）应使用`$$ 数学公式 $$`添加，且`$$`前后没有空白行
- **列表中的行内数学公式**应使用`\$$ 数学公式 $$`添加

```markdown
<!-- 块级数学公式，保留所有空白行 -->

$$
LaTeX数学表达式
$$

<!-- 公式编号，保留所有空白行 -->

$$
\begin{equation}
  LaTeX数学表达式
  \label{eq:标签名}
\end{equation}
$$

可以引用为\eqref{eq:标签名}。

<!-- 段落中的行内数学公式，无空白行 -->

"Lorem ipsum dolor sit amet, $$ LaTeX数学表达式 $$ consectetur adipiscing elit."

<!-- 列表中的行内数学公式，转义第一个$ -->

1. \$$ LaTeX数学表达式 $$
2. \$$ LaTeX数学表达式 $$
3. \$$ LaTeX数学表达式 $$
```

> 从v7.0.0开始，MathJax的配置选项已移至`assets/js/data/mathjax.js`{: .filepath }文件，你可以根据需要更改选项，例如添加[扩展][mathjax-exts]。
> 如果你通过`chirpy-starter`构建网站，请将该文件从gem安装目录（使用命令`bundle info --path jekyll-theme-chirpy`查看）复制到你的仓库中的相同目录。
{: .prompt-tip }

[mathjax-exts]: https://docs.mathjax.org/en/latest/input/tex/extensions/index.html

## Mermaid

[Mermaid](https://github.com/mermaid-js/mermaid)是一个很棒的图表生成工具。要在你的文章中启用它，在YAML块中添加以下内容：

```yaml
---
mermaid: true
---
```

然后你可以像使用其他markdown语言一样使用它：用```mermaid`和```包围图表代码。

## 了解更多

有关Jekyll文章的更多知识，请访问[Jekyll文档：文章](https://jekyllrb.com/docs/posts/)。
