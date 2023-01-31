require "csv" 

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
@memo_type = gets.to_i 

if @memo_type == 1
    puts "拡張子を除いたファイルを入力してください"
    new_title = gets + ".csv"
    puts "メモしたい内容を入力してください"
    puts "完了したらcontrol + Dおします"
    CSV.open(new_title,'w') do|csv|
      csv << $stdin.readlines
    end
    
elsif @memo_type == 2
    puts "編集したいcsvファイルを入力してください"
    edit_data = gets + ".csv"
    CSV.foreach(edit_data) do|row|
      puts row
    end
    
    puts "追記したい内容を入力してください"
    puts "完了したらcontrol + Dをおします"
    CSV.open(edit_data,'a') do|csv|
      csv << $stdin.readlines
    end
    
end