class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_bets
  has_many :prizes
  has_many :deliveries

  def compare_exp_level(exp)
    case self.experience
    when 100..300 then self.level = 1
    when 301..600 then self.level = 2
    when 601..1_000 then self.level = 3
    when 1_001..1_700 then self.level = 4
    when 1_701..3_500 then self.level = 5
    when 3_501..5_000 then self.level = 6
    when 5_001..7_000 then self.level = 7
    when 7_001..9_500 then self.level = 8
    when 9_501..11_150 then self.level = 9
    when 11_150..14_000 then self.level = 10
    end
    self.save
  end

  def calc_experience(end_points, start_points)
    @max_points_of_level = start_points.to_i
    return ( ( experience - end_points ) * 100 ) / ( start_points - end_points )
  end

  #converts /user/id to /user/name
  def to_param
    username
  end
end
