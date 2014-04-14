class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.belongs_to :user
      t.belongs_to :question
      t.text :answer_text

    end
  end
end
