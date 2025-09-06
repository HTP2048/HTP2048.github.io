---
title: 入门指南
description: >-
  在这份全面的概述中了解Chirpy的基础知识。
  你将学习如何安装、配置和使用你的第一个基于Chirpy的网站，以及如何将其部署到Web服务器。
author: cotes
date: 2019-08-09 20:55:00 +0800
categories: [博客, 教程]
tags: [入门]
pin: true
media_subpath: '/posts/20180809'
---

## 创建网站仓库

创建网站仓库时，根据你的需求有两种选择：

### 选项1：使用启动模板（推荐）

这种方法简化了升级过程，隔离了不必要的文件，非常适合希望专注于写作、只需最少配置的用户。

1. 登录GitHub并导航到[**启动模板**][starter]。
2. 点击<kbd>Use this template</kbd>按钮，然后选择<kbd>Create a new repository</kbd>。
3. 将新仓库命名为`&lt;username&gt;.github.io`，将`username`替换为你的小写GitHub用户名。

### 选项2：复刻主题

这种方法便于修改功能或UI设计，但在升级时会遇到困难。因此，除非你熟悉Jekyll并计划大量修改此主题，否则不要尝试。

1. 登录GitHub。
2. [复刻主题仓库](https://github.com/cotes2020/jekyll-theme-chirpy/fork)。
3. 将新仓库命名为`&lt;username&gt;.github.io`，将`username`替换为你的小写GitHub用户名。

## 搭建环境

仓库创建完成后，就该搭建开发环境了。主要有两种方法：

### 使用开发容器（Windows推荐）

开发容器通过Docker提供隔离环境，可防止与系统发生冲突，并确保所有依赖项都在容器内管理。

**步骤**：

1. 安装Docker：
   - 在Windows/macOS上，安装[Docker Desktop][docker-desktop]。
   - 在Linux上，安装[Docker Engine][docker-engine]。
2. 安装[VS Code][vscode]和[Dev Containers扩展][dev-containers]。
3. 克隆你的仓库：
   - 对于Docker Desktop：启动VS Code并[在容器卷中克隆仓库][dc-clone-in-vol]。
   - 对于Docker Engine：在本地克隆仓库，然后通过VS Code[在容器中打开][dc-open-in-container]。
4. 等待开发容器设置完成。

### 原生搭建（类Unix系统推荐）

对于类Unix系统，你可以原生搭建环境以获得最佳性能，不过也可以选择使用开发容器作为替代方案。

**步骤**：

1. 按照[Jekyll安装指南](https://jekyllrb.com/docs/installation/)安装Jekyll，并确保已安装[Git](https://git-scm.com/)。
2. 将仓库克隆到本地机器。
3. 如果你复刻了主题，安装[Node.js][nodejs]并在根目录运行`bash tools/init.sh`以初始化仓库。
4. 在仓库根目录运行命令`bundle`以安装依赖项。

## 使用方法

### 启动Jekyll服务器

要在本地运行网站，请使用以下命令：

```terminal
$ bundle exec jekyll serve
```

> 如果你使用开发容器，必须在**VS Code**终端中运行该命令。
{: .prompt-info }

几秒钟后，本地服务器将在<http://127.0.0.1:4000>可用。

### 配置

根据需要更新`_config.yml`{: .filepath}中的变量。一些常见选项包括：

- `url`
- `avatar`
- `timezone`
- `lang`

### 社交联系选项

社交联系选项显示在侧边栏底部。你可以在`_data/contact.yml`{: .filepath}文件中启用或禁用特定联系信息。

### 自定义样式表

要自定义样式表，请将主题的`assets/css/jekyll-theme-chirpy.scss`{: .filepath}文件复制到你的Jekyll网站的相同路径，并在文件末尾添加你的自定义样式。

### 自定义静态资源

静态资源配置在版本`5.1.0`中引入。静态资源的CDN在`_data/origin/cors.yml`{: .filepath}中定义。你可以根据网站发布地区的网络情况替换其中一些资源。

如果你倾向于自托管静态资源，请参考[_chirpy-static-assets_](https://github.com/cotes2020/chirpy-static-assets#readme)仓库。

## 部署

部署前，请检查`_config.yml`{: .filepath}文件，确保`url`配置正确。如果你偏好[**项目站点**](https://help.github.com/en/github/working-with-github-pages/about-github-pages#types-of-github-pages-sites)且不使用自定义域名，或者想在非**GitHub Pages**的Web服务器上通过基础URL访问网站，请记得将`baseurl`设置为你的项目名称，以斜杠开头，例如`/project-name`。

现在你可以选择以下任意一种方法部署你的Jekyll网站。

### 使用GitHub Actions部署

准备工作：

- 如果你使用GitHub免费计划，请保持网站仓库公开。
- 如果你已将`Gemfile.lock`{: .filepath}提交到仓库，且你的本地机器未运行Linux，请更新锁定文件的平台列表：

  ```console
  $ bundle lock --add-platform x86_64-linux
  ```

接下来，配置“页面”服务：

1. 进入你在GitHub上的仓库。选择“设置”标签，然后点击左侧导航栏中的“页面”。在（“构建和部署”下方的）“源”部分，从下拉菜单中选择[**GitHub Actions**][pages-workflow-src]。
   ![Build source](pages-source-light.png){: .light .border .normal w='375' h='140' }
   ![Build source](pages-source-dark.png){: .dark .normal w='375' h='140' }

2. 向GitHub推送任意提交以触发“Actions”工作流。在仓库的“Actions”标签中，你应该会看到“Build and Deploy”工作流正在运行。构建完成并成功后，网站将自动部署。

现在你可以访问GitHub提供的URL来查看你的网站。

### 手动构建和部署

对于自托管服务器，你需要在本地机器上构建网站，然后将网站文件上传到服务器。

导航到源项目的根目录，使用以下命令构建你的网站：

```console
$ JEKYLL_ENV=production bundle exec jekyll b
```

除非你指定了输出路径，否则生成的网站文件将放在项目根目录的`_site`{: .filepath}文件夹中。将这些文件上传到你的目标服务器。

[nodejs]: https://nodejs.org/
[starter]: https://github.com/cotes2020/chirpy-starter
[pages-workflow-src]: https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-with-a-custom-github-actions-workflow
[docker-desktop]: https://www.docker.com/products/docker-desktop/
[docker-engine]: https://docs.docker.com/engine/install/
[vscode]: https://code.visualstudio.com/
[dev-containers]: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
[dc-clone-in-vol]: https://code.visualstudio.com/docs/devcontainers/containers#_quick-start-open-a-git-repository-or-github-pr-in-an-isolated-container-volume
[dc-open-in-container]: https://code.visualstudio.com/docs/devcontainers/containers#_quick-start-open-an-existing-folder-in-a-container
