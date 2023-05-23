# パスワードの入力
$password = Read-Host "RStudioのパスワードを入力してください"
# 環境変数へ設定
$env:PASSWORD = $password
# RStudioコンテナを起動
docker-compose up -d --build
# RStudioを起動
Start-Process http://localhost:8787
