def addProject(fileName)
    Project.connection
    if !fileName.present?
        puts "You must specify an project."
    else
        begin
            absPath = File.join(Dir.pwd, fileName)
            puts "Searching for project file in #{absPath}."
            file = File.read(fileName)
        rescue 
            puts "#{fileName} not found."
            puts "You must specify an existing file."
        end
        if !file.nil?
            lines = file.lines

            metadata = lines.take_while { |l| l.chomp.match(/^\s*$/) != nil }
            name, link, precedence = metadata
            deprecated = true if link.match(/^#/) == nil

            content = lines.drop_while { |l| l.chomp.match(/^\s*$/) != nil }
            content = content[1..-1]
            content = content.join

            p = Project.where(name: name).first_or_create
            p.update_attributes(
              link: link, 
              content: content, 
            )
            p.update_attributes(deprecated: deprecated) if deprecated
            p.update_attributes(precedence: precedence) if precedence
        end
    end
end

namespace :project do
    desc "Add an project to the database from the specified path"
    task :add, [:project] => [:environment] do |t, args|
        addProject(args[:project])
    end
    task :remove, [:id] => [:environment] do |t, args|
        Project.connection
        id = args[:id]
        Project.find(id).delete
    end
    task :search, [:prop, :value] => [:environment] do |t, args|
        Project.connection
        prop = args[:prop]
        value = args[:value]
        searchHash = {}
        searchHash[prop] = value
        articles = Project.where(searchHash)
        articles.each do |a|
            puts "#{a.id}: #{a.name}"
        end
    end
    task :remove_all, [] => [:environment] do |t, args|
        Project.connection
        Project.destroy_all
    end
    task :add_all, [:directory] => [:environment] do |t, args|
        relPath = args[:directory] ? args[:directory] : "./projects"
        absPath = File.join(Dir.pwd, relPath)
        puts "Searching in #{absPath} for .project files."
        files = Dir[File.join(absPath, "*.project")]
        files.each { |path| addProject(path) }
    end
end
