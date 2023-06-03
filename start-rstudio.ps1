# Dockerが起動していない場合は警告出力して終了
$dockerProcess = Get-Process | Where-Object {$_.ProcessName -like "docker"}
if (-not $dockerProcess) {
    Write-Host "Docker is not running." -ForegroundColor Red
    Exit
}

# パスワードの入力
$password = Read-Host "RStudioのパスワードを入力してください"
# 環境変数へ設定
$env:PASSWORD = $password
# RStudioコンテナを起動
docker-compose up -d --build
# RStudioを起動
Start-Process http://localhost:8787
