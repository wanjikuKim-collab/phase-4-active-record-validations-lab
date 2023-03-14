class Post < ApplicationRecord
    # In Built methods
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: ["Fiction","Non-Fiction"]}

    #Custom methods
    validate :title_is_sufficiently_clickbait_y?

    def title_is_sufficiently_clickbait_y?
		valids = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
		if valids.none?{|par| par.match title}
			errors.add(:title, "not clickbait")
		end
	end
end
