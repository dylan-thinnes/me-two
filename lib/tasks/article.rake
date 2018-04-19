def getUserConfirmation(question)
    puts "#{question} (Y/n)"
    answer = STDIN.gets.chomp
    return "Y" == answer
end

namespace :article do
    desc "Add an article to the database from the specified path"
    task :add, [:article] => [:environment] do |t, args|
        Article.connection
        article = args[:article]
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
                published = getUserConfirmation "Should this article be automatically published?"
                a = Article.where(title: title).first_or_create
                a.update_attributes(author: author, blurb: blurb, published: published, content: content)
            end
        end
    end
end
