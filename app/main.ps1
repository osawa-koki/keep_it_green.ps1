
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

  # 一日に最低何回コミットするか取得
  while ($true) {
    $commit_count_min = Read-Host "一日に最低何回コミットしますか??? -> ".Trim()

    if ($commit_count_min -match "^[0-9]+$") {
      break
    }
    Clear-Host
    Write-Host "適当な数値を入力してください。"
  }

  # 一日に最高何回コミットするか取得
  while ($true) {
    $commit_count_max = Read-Host "一日に最高何回コミットしますか??? -> ".Trim()

    if ($commit_count_max -match "^[0-9]+$") {
      if ($commit_count_min -le $commit_count_max) {
        break
      } else {
        Clear-Host
        Write-Host "最高値は最小値以上にしてください。"
        continue
      }
    }
    Clear-Host
    Write-Host "適当な数値を入力してください。"
  }

  # 実行確認
  Write-Host "以下の内容で実行します。よろしいですか？\n"
  Write-Host "開始日時: $start_datetime\n"
  Write-Host "一日に最低何回コミットしますか: $commit_count_min\n"
  Write-Host "一日に最高何回コミットしますか: $commit_count_max\n"
  $answer = Read-Host "実行しますか？(y/n) -> ".Trim()

  if ($answer -ne "y") {
    continue
  }



}

