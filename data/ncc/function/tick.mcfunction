# チックをゲーム内時間 0時（24時）が朝に変換する定数。直値が使えないため。
execute as @a at @s run scoreboard players set @s toh 1000

# 定数用のscoreboardの種類削減のため、tohを使うのでチック数 x 1000で判定
# 1tick = 0.05秒で1000増えるので、10000であれば10チック = 0.5秒。
execute as @a at @s run scoreboard players operation @s tcnt += @s toh
execute as @a at @s if score @s tcnt matches 10000 run function ncc:tickmain


# カウンタに達したのでリセット
execute as @a at @s if score @s tcnt matches 10000 run scoreboard players set @s tcnt 0
