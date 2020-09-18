# グローバル設定

# プロバイダーをAWSに指定
provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

# 作成するリソースのプレフィックス
variable "prefix" {
  default = "sample-app"
}
