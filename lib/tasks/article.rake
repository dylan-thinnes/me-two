def present(str)
    return true if str.present?
    return false
end

def getUserInput(inputName)
    puts "Enter #{inputName}: "
    input = STDIN.gets.chomp
    while !(yield input)
        puts "#{inputName.capitalize} invalid. Try again."
        input = STDIN.gets.chomp
    end
    return input
end

def getUserConfirmation(question)
    puts "#{question} (Y/n)"
    answer = STDIN.gets.chomp
    return "Y" == answer
end

namespace :article do
    desc "Add an article to the database within the specified directory"
    task :add, [:article] => [:environment] do |t, args|
        Article.connection
        article = args[:article]
        if !article.present?
            puts "You must specify an article."
        else
            begin
                content = File.read(article)
            rescue 
                puts "#{article} not found."
                puts "You must specify an existing file."
            end
            if !content.nil?
                title = getUserInput("title")   { |s| present s }
                author = getUserInput("author") { |s| present s }
                blurb = getUserInput("blurb")   { |s| present s }
                while !(getUserConfirmation "Is the data entered correct?")
                    puts "Please update the data to make it correct."
                    temp = getUserInput("title") { true }
                    title = temp if temp.present?
                    temp = getUserInput("author") { true }
                    author = temp if temp.present?
                    temp = getUserInput("blurb") { true }
                    blurb = temp if temp.present?
                end
                published = !(getUserConfirmation "Should this article be automatically published?")
                Article.create!(title: title, author: author, blurb: blurb, published: published, content: content)
            end
        end
    end
end
