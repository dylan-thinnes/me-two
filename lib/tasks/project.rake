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
end
