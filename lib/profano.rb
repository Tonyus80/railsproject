require 'tokenizer'
require 'csv'

class Profano
  def self.initialize()

    @profaneWords = ''
    #define condition
    @cleanWords = true

  end
  def self.loadProfanoList(filePath)
    @profaneWords = CSV.read(filePath)
    @profaneWords
  end

  def self.profanoFilter(content)
    @cleanWords = true
    #Detect white space split words
    @tokenizer = Tokenizer::WhitespaceTokenizer.new
    @content = content.to_s
    @tokenizeContent = @tokenizer.tokenize(@content)
    @tokenizeContent.each do |word|
      @cleanWords = false if @profaneWords.include?([word])
    end
    @cleanWords
  end

end