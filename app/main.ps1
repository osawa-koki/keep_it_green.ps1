
Clear-Host

while ($true) {
  # 何日前から草を生やすか取得
  while ($true) {
    $days_before = Read-Host "何日前から草を生やしますか??? -> ".Trim()

    if (($days_before -eq "bye") -or ($days_before -eq "exit")) {
      Write-Output "bye..."
      exit
    }

    if ($days_before -match "^[0-9]+$") {
      break
    }
    Clear-Host
    Write-Output "適当な数値を入力してください。"
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
    Write-Output "適当な数値を入力してください。"
  }

  # 一日に最高何回コミットするか取得
  while ($true) {
    $commit_count_max = Read-Host "一日に最高何回コミットしますか??? -> ".Trim()

    if ($commit_count_max -match "^[0-9]+$") {
      if ($commit_count_min -lt $commit_count_max) {
        break
      } else {
        Clear-Host
        Write-Output "最高値は最小値以上にしてください。"
        continue
      }
    }
    Clear-Host
    Write-Output "適当な数値を入力してください。"
  }

  # 実行確認
  Write-Output "以下の内容で実行します。よろしいですか？`n"
  Write-Output "開始日時: $start_datetime`n"
  Write-Output "一日に最低何回コミットしますか: $commit_count_min`n"
  Write-Output "一日に最高何回コミットしますか: $commit_count_max`n"
  $answer = Read-Host "実行しますか？(y/n) -> ".Trim()

  if ($answer -ne "y") {
    continue
  }

  # 実行開始

  #git init

  $running_datetime = $start_datetime

  while ($running_datetime -lt $current_datetime) {
    # 一日のコミット回数を取得
    $commit_count = Get-Random -Minimum $commit_count_min -Maximum $commit_count_max

    # 一日のコミット回数分ループ
    for ($i = 0; $i -lt $commit_count; $i++) {
      # コミットするファイルを作成
      $file_name = "dummy.txt"
      Write-Output "keep it green !" >> $file_name

      # コミット
      git add .
      git commit -m "add $file_name" --date="$running_datetime"
      git rebase HEAD~1 --committer-date-is-author-date
    }

    # 次の日に移動
    $running_datetime = $running_datetime.AddDays(1)
  }


}

