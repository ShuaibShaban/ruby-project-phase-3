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

