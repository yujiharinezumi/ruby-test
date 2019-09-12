class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してください"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"

    player_hand = gets.to_i

    unless player_hand == 0 || player_hand == 1 || player_hand == 2
      puts "値が無効です。再度入力してください"
      player_hand = gets.to_i
    end
    return player_hand
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_result = [0,1,2]

    enemy_hand = enemy_result.sample

    puts "#{ enemy_hand}"
    return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    result = (player_hand - enemy_hand + 3) % 3

    jankens = ["グー","チョキ","パー"]

    if result == 0
      puts "相手は#{jankens[enemy_hand]}です。あいこでしょ。"

      player = Player.new
      enemy = Enemy.new
      self.pon(player.hand, enemy.hand)

    elsif result == 2
      puts "相手は#{jankens[enemy_hand]}です。あなたの勝ちです。"
    else
      puts "相手は#{jankens[enemy_hand]}です。あなたの負けです。"
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)



# player = Player.new の意味はPlayerクラスをplayerという名前をつけて実態化させている
# 大文字のPlayerと小文字のplayerの違い  大文字はクラスで実際のものは存在せず、設計図のように内容が書いてある、小文字は.newを使って大文字のクラスの内容通りに実態化を作ったもの

# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
