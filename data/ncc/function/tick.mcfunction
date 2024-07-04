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
execute as @a at @s store result score @s health run time data get entity @s health

# 表示。矢印は条件分岐が必要その分を記述。↑は180/-180のプラスマイナス境界を含むので条件が2個
execute as @a[scores={dir=159..180}  ] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↑ : "}, {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=-180..-158}] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↑ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]

execute as @a[scores={dir=-157..-113}] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↗ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=-112..-68} ] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | → : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=-67..-22}  ] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ➘ : "}, {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=-23..23}   ] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↓ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=24..68}    ] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↙ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=69..113}   ] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ← : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]
execute as @a[scores={dir=114..158}  ] run title @s actionbar [{"score": {"objective": "now", "name": "@s" }}, {"text":"h | ↖ : "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}]

# 死亡時はログに座標を残す
execute as @a[scores={health=0}      ] run tellraw @a [{"selector": "@s"}, {"text": " was dead at "}, {"score": {"objective": "now", "name": "@s" }}, {"text":"h | "},  {"score": {"objective": "coordx", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordy", "name": "@s" }}, {"text":", "}, {"score": {"objective": "coordz", "name": "@s" }}, {"text": " (drop items disappear after 6h)"}]
