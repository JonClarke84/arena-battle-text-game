class Character
  def initialize(name, health, attack_damage)
    @name = name
    @health = health
    @attack_damage = attack_damage
  end

  def name
    return @name
  end

  def health
    return @health
  end

  def attack
    crit = rand(1..6)
    if crit >= 5
      return @attack_damage * 2
    else
      return @attack_damage
    end
  end

  def take_damage(attack_damage)
    @health -= attack_damage
  end
end

def init
  puts "*************************************************"
  puts "***********WELCOME TO THE ARENA!*****************"
  puts "***************GET READY!************************"
  puts ""
  print "Enter your name and press ENTER: "
end

def create_player
  player = Character.new(gets.chomp, 100, 20)
end

def create_enemy(name, health, damage)
  enemy = Character.new(name, health, damage)
end

def key_check(desired_keys, input)
  while input != desired_keys
    print "Error, try again: "
    input = gets.chomp
  end
end

def init_combat(enemy, player)
  puts ""
  puts "*************************************************"
  puts "TODAY YOU WILL BE FIGHTING #{enemy.name.upcase}!"
  puts "***************GET READY!************************"
  puts ""

  while enemy.health > 0 && player.health > 0
    puts "*************************************************#{player.name}: #{player.health}HP"
    puts "*************************************************#{enemy.name}: #{enemy.health}HP"
    puts ""
    puts "A for attack, D for dodge, S for special, H for health potion"

    print "Choose your action and press ENTER: "
    input =  gets.chomp.downcase
    
    desired_keys = "a"

    key_check(desired_keys, input)

    enemy.take_damage(player.attack)

    puts "\e[H\e[2J"

    puts "You hit #{enemy.name} for #{player.attack} damage!"
    puts ""

    player.take_damage(enemy.attack)
    puts "#{enemy.name} hits you back for #{enemy.attack} damage!"
    puts ""

  end

  puts "*************************************************#{player.name}: #{player.health}HP"
  puts "*************************************************#{enemy.name}: #{enemy.health}HP"
  puts ""

  victory_condition(player.health, enemy.health)

end

def victory_condition(player_health, enemy_health)
  if player_health > enemy_health
    puts "CONGRATULATIONS, YOU WIN!"
  else
    puts "YOU LOSE!"
  end
end

init
player = create_player
goblin = create_enemy("The Fat Goblin", 80, 15)
init_combat(goblin, player)