ActiveRecord::Base.establish_connection("sqlite3:db/development.db")


class Article < ActiveRecord::Base
   belongs_to :user
   belongs_to :categories
   has_many :article_keywords
   has_many :keywords, through: :article_keywords
end

class Category < ActiveRecord::Base
    has_many :articles
end

class ArticleKeyword < ActiveRecord::Base
    belongs_to :article
    belongs_to :keyword
end

class Keyword < ActiveRecord::Base
    has_many :article_keywords
    has_many :articles, through: :article_keywords
end

class User < ActiveRecord::Base
    has_many :articles
    # has_secure_password
end