# class MyValidator < ActiveModel::Validator
#   def validate(post)
#     unless post.title.include? "Won't Believe" || "Secret" || "Top" || "Guess")
#       post.errors.add :title, "Is not clickbait!"
#     end
#   end
# end

class Post < ActiveRecord::Base
  
  validates :title, presence: true
  binding.pry
  
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_not_gonna_get_clicks

  def title_not_gonna_get_clicks
    good_words = ["Won't Believe", "Secret", "Top", "Guess"] 
    if title
      if good_words.any? {|words| title.include? words} == false
        errors.add(:title, "not gonna get clicks!")
      end
    end
  end


end

 # if title.include?("Won't Believe") || title.include?("Secret") || title.include("Top") || title.include("Guess")
    #   binding.pry

  # def does_title_exist
  #   if title.exist? == false
  #     errors.add :title, "Needs Title"
  #   end
  # end







# class MyValidator < ActiveModel::Validator
#   def validate(post)
#     # if post.title.blank? == true
#     #   post.errors.add :title, "Needs a title!"
#     # end
#     unless post.title.include? "Won't Believe" || "Secret" || "Top" || "Guess"
#       post.errors.add :title, "Is not clickbait!"
#     end
#   end
# end

# # include ActiveModel::Validations
  # validates_with MyValidator