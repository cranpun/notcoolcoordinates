# データ更新
## 座標
execute as @a at @s store result score @s coordx run data get entity @s Pos[0] 1
execute as @a at @s store result score @s coordy run data get entity @s Pos[1] 1
execute as @a at @s store result score @s coordz run data get entity @s Pos[2] 1

## 方向
execute as @a at @s store result score @s dir run data get entity @s Rotation[0] 1

## 時間
execute as @a at @s run scoreboard players set @s toh 1000
execute as @a at @s store result score @s now run time query daytime
execute as @a at @s run scoreboard players operation @s now /= @s toh

## 体力
execute as @a at @s store result score @s health run data get entity @s Health

# 表示。矢印は条件分岐が必要その分を記述。↑は180/-180のプラスマイナス境界を含むので条件が2個
execute as @a[scores={dir=159..180}  ] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↑ : "}, {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=-180..-158}] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↑ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]

execute as @a[scores={dir=-157..-113}] at @s run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↗ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=-112..-68} ] at @s run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | → : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=-67..-22}  ] at @s run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ➘ : "}, {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=-23..23}   ] at @s run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↓ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=24..68}    ] at @s run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↙ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=69..113}   ] at @s run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ← : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=114..158}  ] at @s run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↖ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]

# 死亡時はログに座標を残す
execute as @a at @s if score @s dflag matches 0 if score @s health matches 0 run tellraw @a [{"selector": "@s"}, {"text": " was dead at "}]
execute as @a at @s if score @s dflag matches 0 if score @s health matches 0 run tellraw @a [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a at @s if score @s dflag matches 0 if score @s health matches 0 run tellraw @a [{"text": "(drop items disappear after 6h)"}]

# flags after proc
## 体力が0になったらdflagを1にする（health = 0 && dflag == 0が、死亡初回条件）
execute as @a as @s if score @s health matches 0 run scoreboard players set @s dflag 1
execute as @a as @s unless score @s health matches 0 run scoreboard players set @s dflag 0
