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
  

