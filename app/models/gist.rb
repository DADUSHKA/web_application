class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def entry_in_the_table(question, gist_url, user_id)
    self.question = question
    self.gist_url = gist_url
    self.user_id = user_id
    save!
  end
end
