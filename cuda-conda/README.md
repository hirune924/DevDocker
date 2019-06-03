# 開発用Docker Imageを作ろう！！
## 思想
1. CUDA周り(devのものを使用してできるだけモリモリに)
2. パッケージ基本セット（コンパイラ、エディタ、その他...基本的にはaptで入れるやつ）
3. pythonライブラリの基本セット(基本的にはpipで入れるやつ)
4. CUDA-Xに相当するレイヤ、これは目的に応じて色々と組み替えたものを用意する
5. xhostやマウント、プロキシの設定などbuild,run用の便利スクリプト

## 詳細
1. CUDA周り(dockerhubのnvidia/cuda:10.0-devel-ubuntu18.04を使用、時代とともにアップデートしていく)

2. パッケージ基本セット
* コンパイラ、ビルドツール、デバッグツールなど
  * build-essential
  * gcc
  * g++
  * make
  * cmake

  * bazel
  * ant
  * 
* エディタ
  * vim

* その他
  * git
  * unzip
  * wget
  * curl

3. pythonライブラリの基本セット

4. CUDA-Xに準拠

5. ある程度imageできてから考えるかなぁ
