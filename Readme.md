# ChineseNLP

![Release Vision](https://img.shields.io/badge/release-failed-ff0000.svg)
![Repo Size](https://img.shields.io/github/repo-size/GalAster/ChineseNLP.svg)
![Code Size](https://img.shields.io/github/languages/code-size/GalAster/ChineseNLP.svg)

## Introduction

以下是本项目用到的外部库, 其他功能为 Mathematica 原生实现.

- HanLP: https://github.com/hankcs/HanLP
- FudanNLP: https://github.com/FudanNLP/fnlp
- QA-System: https://github.com/ysc/QuestionAnsweringSystem
- Chinese-Word-Vectors: https://github.com/Embedding/Chinese-Word-Vectors
- ELMoForManyLangs: https://github.com/HIT-SCIR/ELMoForManyLangs

感谢相关项目的作者.

## System Requirements

该项目不会特意向下兼容低版本与低配, 请至少满足以下环境要求:

![Mathematica](https://img.shields.io/badge/Mathematica-%3E%3D11.3-brightgreen.svg)
![JRE](https://img.shields.io/badge/JRE-%3E%3D1.7-green.svg)
![UTF8](https://img.shields.io/badge/Encode-UTF8-red.svg)

建议 `$UserBaseDirectory` 所在磁盘空间大于 4G 以存放模型和缓存, 可用内存大于1G以加载模型.

另外部分功能需要用到 Mathematica 深度学习框架, 建议配置独立显卡.

## Install

ChineseNLP 定位不是轻量级工具包, 而是大而全的军械库

因此 ChineseNLP 体积过大无法通过 Paclets Server 分发.

请手动下载: https://m.vers.site/Paclets/Latest/ChineseNLP.7z

并解压到 `$UserBaseDirectory`, 这个值可以在 `init.m` 中指定.

最终的目录形式应类似于:

```yaml
- ApplicationData/
- Application/
    - ChineseNLP/
        - Kernel/
        - PacletInfo.m
        - ChineseNLPLoader.m
```

## Show Time

![](https://i.loli.net/2018/09/08/5b938306cb52f.png)

![](https://i.loli.net/2018/09/07/5b929426ade44.png)

![](https://i.loli.net/2018/09/07/5b929803a4aa3.png)

## License
