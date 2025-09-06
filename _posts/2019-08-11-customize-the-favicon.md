---
title: 自定义网站图标
author: cotes
date: 2019-08-11 00:34:00 +0800
categories: [博客，教程]
tags: [网站图标]
---

[**Chirpy**](https://github.com/cotes2020/jekyll-theme-chirpy/)的[网站图标](https://www.favicon-generator.org/about/)位于`assets/img/favicons/`{: .filepath}目录中。你可能想要用自己的图标替换它们。以下部分将指导你创建并替换默认的网站图标。

## 生成网站图标

准备一张尺寸为512x512或更大的方形图片（PNG、JPG或SVG格式），然后访问在线工具[**Real Favicon Generator**](https://realfavicongenerator.net/)，点击<kbd>Select your Favicon image</kbd>按钮上传你的图片文件。

下一步，网页会显示所有使用场景。你可以保持默认设置，滚动到页面底部，点击<kbd>Generate your Favicons and HTML code</kbd>按钮生成网站图标。

## 下载并替换

下载生成的压缩包，解压后从提取的文件中删除以下两个文件：

- `browserconfig.xml`{: .filepath}
- `site.webmanifest`{: .filepath}

然后将剩余的图片文件（`.PNG`{: .filepath}和`.ICO`{: .filepath}）复制到你的Jekyll网站的`assets/img/favicons/`{: .filepath}目录中，覆盖原文件。如果你的Jekyll网站还没有这个目录，创建一个即可。

下表将帮助你了解网站图标文件的变更情况：

| 文件    | 来自在线工具 | 来自Chirpy |
| ------- | :----------: | :--------: |
| `*.PNG` |      ✓       |     ✗      |
| `*.ICO` |      ✓       |     ✗      |

<!-- markdownlint-disable-next-line -->
> ✓表示保留，✗表示删除。
{: .prompt-info }

下次构建网站时，网站图标将被替换为自定义版本。
