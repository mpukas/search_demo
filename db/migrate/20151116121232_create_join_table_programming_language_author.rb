class CreateJoinTableProgrammingLanguageAuthor < ActiveRecord::Migration
  def change
    create_join_table :programming_languages, :authors do |t|
      # t.index [:programming_language_id, :author_id]
      # t.index [:author_id, :programming_language_id]
    end
  end
end
