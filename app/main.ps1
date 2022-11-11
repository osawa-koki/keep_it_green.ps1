
Clear-Host

while ($true) {
  # 何日前から草を生やすか取得
  while ($true) {
    $days_before = Read-Host "何日前から草を生やしますか??? -> ".Trim()

    if (($days_before -eq "bye") -or ($days_before -eq "exit")) {
      Write-Host "bye..."
      exit
    }

    if ($days_before -match "^[0-9]+$") {
      break
    }
    Clear-Host
    Write-Host "適当な数値を入力してください。"
  }

  # 現在の日時を取得
  $current_datetime = Get-Date

  # 開始日時を取得
  $start_datetime = $current_datetime.AddDays(-$days_before)

  Write-Host $start_datetime



}

