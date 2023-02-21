require_relative 'lib/Articles.rb'
require_relative 'lib/Author.rb'
require_relative 'lib/Magazine.rb'

author1 = Author.new("Shuaib Doe")
author2 = Author.new("Shaban Smith")

magazine1 = Magazine.new("Vogue", "Fashion")
magazine2 = Magazine.new("National Geographic", "Science")
puts "all #{Magazine.all}"

article1 = Article.new(author1, magazine1, "10 Trends for Spring")
article2 = Article.new(author1, magazine2, "Wildlife Conservation")
article3 = Article.new(author2, magazine2, "Volcanic Eruptions")

author1.add_article(magazine2, "Ocean Exploration")
author2.add_article(magazine2, "Rainforest Preservation")



# pp author1.articles
# # should return [article1, article2]

# pp author1.magazines
# # should return [magazine1, magazine2]

# pp author2.magazines
# # should return [magazine2]

p magazine1.article_titles

# p magazine2.article_titles
# # should return ["Wildlife Conservation", "Ocean Exploration", "Rainforest Preservation"]

# p magazine1.contributing_authors
p magazine2.contributing_authors
# # should return [author1, author2]
author1.add_article(magazine1, "The Moringa School")

p Article.all

p Magazine.all
