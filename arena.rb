class Arena
  # 3. add a reader for both player and enemy
  # enter code here
  attr_reader :player, :enemy

  def initialize(player:, enemy:)
    # 2. Create an instance variable for player and enemy
    # enter code here
    @player = Player.new(player)
    @enemy = Player.new(enemy)
  end

  def start
    puts "Welcome to the Arena!"
    puts "You are fighting #{enemy.name}!"
    while player.hp > 0 && enemy.hp > 0
      # 4. Implement actions where Player and Enemey will both fight. Player and Enemy will do a random action.
      # ACTIONS are: attack and use_potion
      # enter code here
      playerActons = [attack(@player,@enemy), @player.use_potion, critical(@player,@enemy)]
      enemyActions = [attack(@enemy,@player), @enemy.use_potion, critical(@enemy,@player)]

      playerActons.sample
      enemyActions.sample

      puts "Your health: #{player.hp}"
      puts "#{enemy.name}'s health: #{enemy.hp}"
    end

    if player.hp > 0
      puts "You win!"
    else
      puts "You lose!"
    end
  end

  private

    def attack(attacker, target)
      damage = attacker.atk - target.def
      target.hp -= damage

      puts "#{attacker.name} attacks #{target.name} for #{damage} damage!"
    end

    def defend(player)
      # player.def *= 1.5
      #after 1 turn 
      #player.def = 5
    end

    def critical(attacker, target)
      crit_rate = rand(1..10)
      if(crit_rate > 5)
        damage = (attacker.atk * 1.5) - target.def
        target.hp -= damage
        puts "#{attacker.name} attacks with critical damage #{target.name} for #{damage} damage!"
      end
    end
    # 5.Challenge: Create a method where player can defend
    # Specs: Defending can make the defender's defense x1.5 in 1 turn
end
