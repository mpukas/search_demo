class ProgrammingLanguage < ActiveRecord::Base
  has_and_belongs_to_many :types
  has_and_belongs_to_many :authors

  searchable do
    text :name
    text :types do
      types.map(&:name)
    end
    text :authors do
      authors.map(&:name)
    end
  end

end
