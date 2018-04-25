namespace :project do
    desc "Add an project to the database from the specified path"
    task :add, [:project] => [:environment] do |t, args|
        Project.connection
        project = args[:project]
        if !project.present?
            puts "You must specify an project."
        else
            begin
                file = File.read(project)
            rescue 
                puts "#{project} not found."
                puts "You must specify an existing file."
            end
            if !file.nil?
                parts = file.lines
                name = parts[0].chomp
                link = parts[1].chomp
                content = parts[3..-1].join
                p = Project.where(name: name).first_or_create
                p.update_attributes(link: link, content: content)
            end
        end
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
end
