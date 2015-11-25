class CreateJoinTableProgrammingLanguageType < ActiveRecord::Migration
  def change
    create_join_table :programming_languages, :types do |t|
      # t.index [:programming_language_id, :type_id]
      # t.index [:type_id, :programming_language_id]
    end
  end
end
