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
    return @attack_damage
  end

  def take_damage(attack_damage)
    @health -= attack_damage
  end
end

def init
  puts "Welcome to the arena!"
end

def create_player
  player = Character.new(gets.chomp, 100, 20)
end

def key_check(desired_keys, input)
  while input != desired_keys
    print "Error, try again: "
    input = gets.chomp
  end
end

init
print "Enter your name and press ENTER: "
player = create_player

puts ""
puts "*************************************************"
puts "TODAY YOU WILL BE FIGHTING THE UNASSUMING GOBLIN!"
puts "***************GET READY!************************"
puts ""

goblin = Character.new("The Unassuming Goblin", 75, 15)

while goblin.health > 0 && player.health > 0
  puts "*************************************************#{player.name}: #{player.health}HP"
  puts "*************************************************#{goblin.name}: #{goblin.health}HP"
  puts ""
  puts "A for attack, D for dodge, S for special, H for health potion"

  print "Choose your action and press ENTER: "
  input =  gets.chomp.downcase
  
  desired_keys = "a"

  key_check(desired_keys, input)

  goblin.take_damage(player.attack)

  puts "\e[H\e[2J"

  puts "You hit #{goblin.name} for #{player.attack} damage!"
  puts ""

  player.take_damage(goblin.attack)
  puts "#{goblin.name} hits you back for #{goblin.attack} damage!"
  puts ""

end

if player.health > goblin.health
  puts "CONGRATULATIONS, YOU WIN!"
else
  puts "YOU LOSE!"
end
