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
end

def init
  puts "Welcome to the arena!"
end

def create_player
  player = Character.new(gets.chomp, 100, 20)
end

init
print "Enter your name and press ENTER: "
player = create_player

puts "Your name is #{player.name} and you currently have #{player.health}HP."
