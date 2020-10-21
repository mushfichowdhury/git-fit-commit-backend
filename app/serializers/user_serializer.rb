class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :sex, :age, :startingWeight, :currentWeight, :goalWeight, :macros, :skillLevel, :equipment

  has_many :exercises

  def exercises
    self.object.exercises.filter{ |e| e.equipment == e.user.equipment}
  end

  def currentWeightInt
    self.object.currentWeight.map do |cw|
      cw.each do |c|
        c.to_i
      end
    end
  end
end
