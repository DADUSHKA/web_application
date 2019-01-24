class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def entry_in_the_table(question_id, gist_url, user_id)
    self.question_id = question_id
    self.gist_url = gist_url
    self.user_id = user_id
    save!
  end
end
