# This code defines three classes: Author, Magazine, and Article.
# It provides methods for initializing instances of these classes,
# and for establishing object relationships between them.

class Author
    attr_reader :name
    
    # Initializes an instance of Author with a name.
    def initialize(name)
      @name = name
    end
  
    # Returns the name of the author.
    def name
      @name
    end
  
    # Returns an array of Article instances the author has written.
    def articles
      Article.all.select {|article| article.author == self}
    end
  
    # Returns a unique array of Magazine instances for which the author has contributed to.
    def magazines
      self.articles.map {|article| article.magazine}.uniq
    end
  
    # Given a magazine (as a Magazine instance) and a title (as a string), creates a new Article instance and associates it with that author and that magazine.
    def add_article(magazine, title)
      Article.new(self, magazine, title)
    end
  
    # Returns a unique array of strings with the categories of the magazines the author has contributed to.
    def topic_areas
      self.magazines.map {|magazine| magazine.category}.uniq
    end
  end
  
  class Magazine
    attr_accessor :name, :category
    
    @@all = []
  
    # Initializes an instance of Magazine with a name and category.
    def initialize(name, category)
      @name = name
      @category = category
      @@all << self
    end
  
    # Returns the name of this magazine.
    def name
      @name
    end
  
    # Returns the category of this magazine.
    def category
      @category
    end
  
    # Returns an array of all Magazine instances.
    def self.all
      @@all
    end
  
    # Given a string of magazine name, this method returns the first magazine object that matches.
    def self.find_by_name(name)
      self.all.find {|magazine| magazine.name == name}
    end
  
    # Returns an array string of the titles of all articles written for that magazine.
    def article_titles
      Article.all.select {|article| article.magazine == self}.map {|article| article.title}
    end
  
    # Returns an array of authors who have written more than 2 articles for the magazine.
    def contributing_authors
      Article.all.select {|article| article.magazine == self}.map {|article| article.author}.select {|author| author.articles.count > 2}
    end
  end
  
  class Article
    attr_reader :author, :magazine, :title
    
    @@all = []
  
    # Initializes an instance of Article with an author, a magazine, and a title.
    def initialize(author, magazine, title)
      @author = author
      @magazine = magazine
      @title = title
      @@all << self
    end
  
    # Returns the title for that given article.
    def title
      @title
    end
  
    # Returns an array of all Article instances.
    def self.all
      @@all
    end
  
    # Returns the author for that given article.
    def author
      @author
    end
  
    # Returns the magazine for that given article.
    def magazine
      @magazine
    end
  end
 

author1 = Author.new("John Doe")
puts "author1: #{author1}"
author2 = Author.new("Jane Smith")
puts "author2: #{author2}"

magazine1 = Magazine.new("Vogue", "Fashion")
puts magazine1
magazine2 = Magazine.new("National Geographic", "Science")
puts magazine2

article1 = Article.new(author1, magazine1, "10 Trends for Spring")
puts article1
article2 = Article.new(author1, magazine2, "Wildlife Conservation")
puts article2
article3 = Article.new(author2, magazine2, "Volcanic Eruptions")
puts article3

author1.add_article(magazine2, "Ocean Exploration")
puts author1
author2.add_article(magazine2, "Rainforest Preservation")
puts author2

p author1.articles
# should return [article1, article2]

# p author1.magazines
# # should return [magazine1, magazine2]

# p author2.magazines
# # should return [magazine2]

# p magazine2.article_titles
# # should return ["Wildlife Conservation", "Ocean Exploration", "Rainforest Preservation"]

# p magazine2.contributing_authors
# # should return [author1, author2]

  