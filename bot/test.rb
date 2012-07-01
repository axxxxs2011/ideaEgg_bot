#vim: fileencoding=utf-8
require 'twitter_oauth'
require 'csv'
require 'nkf'

t = TwitterOAuth::Client.new({
  :consumer_key=>'zrMmzR6YqF2fQt8ULX8WoA',
  :consumer_secret=>'pb5IskqdpJduCCaok6Rli9awagnUlh49MUbAvOJjA',
  :token=>'475886743-xgeHjeC8d2khBQcuBAnS6tDw3tJywUFDdiyhgzTX',
  :secret=>'QFJhfTCrwViBGtDEImLRp2X0H5sB3JTkP6KG3olFQo'
})

#class GetIdeaClass
def initialize
    @adj = ""
    @noun = ""
end

def getAdj
    f_adj = File::open("Adj.csv","r")
    @adj = f_adj.readlines[rand(27210)]
    @adj = @adj.gsub(/(\n|\r|")/,"").split(",")
    @adj = @adj[0]
    p @adj
    f_adj.close
end

def getNoun
    f_noun = File::open("Noun.csv","r")
    @noun = f_noun.readlines[rand(60477)]
    @noun = @noun.gsub(/(\n|\r|")/,"").split(",")
    @noun = @noun[0]
    p @noun
    f_noun.close
end
#end

#i = GetIdeaClass.new
getAdj
adj1 = @adj
getNoun
noun1 = @noun

getAdj
adj2 = @adj
getNoun
noun2 = @noun

getNoun
newone = @noun

idea = "新しい" + newone + " = " + adj1  + noun1 + " + " + adj2 + noun2 + " #ideaEgg"

p idea

t.update idea
