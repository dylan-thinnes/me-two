def getArticle(path)
    Article.connection
    article = path
    if !article.present?
        puts "You must specify an article."
    else
        begin
            file = File.read(article)
        rescue 
            puts "#{article} not found."
            puts "You must specify an existing file."
        end
        if !file.nil?
            yield file
        end
    end
end

def addArticle(file)
    parts = file.lines
    title = parts[0].chomp
    author = parts[1].chomp
    blurb = ""
    ii = 3
    while (parts[ii].chomp.present?)
        blurb += parts[ii]
        ii += 1
    end
    ii += 1
    content = parts[ii..-1].join
    a = Article.where(title: title).first_or_create
    a.update_attributes(author: author, blurb: blurb, published: false, content: content)
    return a
end

def publishArticle(file)
    a = addArticle(file)
    a.update_attributes(published: true)
end

namespace :article do
    desc "Add an article to the database from the specified path"
    task :publish, [:article] => [:environment] do |t, args|
        getArticle(args[:article]) { |f| publishArticle f }
    end
    task :add, [:article] => [:environment] do |t, args|
        getArticle(args[:article]) { |f| addArticle f }
    end
    task :remove, [:id] => [:environment] do |t, args|
        Article.connection
        id = args[:id]
        Article.find(id).delete
    end
    task :search, [:prop, :value] => [:environment] do |t, args|
        Article.connection
        prop = args[:prop]
        value = args[:value]
        searchHash = {}
        searchHash[prop] = value
        articles = Article.where(searchHash)
        articles.each do |a|
            puts "#{a.id}: #{a.title}"
        end
    end
end
