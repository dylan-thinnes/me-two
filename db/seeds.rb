# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#a1 = Article.create!(title: "Article 1", blurb: "a1", content: "This is art1", published: false)
#a2 = Article.create!(title: "Article 2", blurb: "a2", content: "This is art2", published: true)
#a3 = Article.create!(title: "Article 3", blurb: "a3", content: "This is art3", published: true)

#p1 = Project.create!(name: "Project 1", link: "https://github.com", content: "proj1")
#p1 = Project.create!(name: "Project 2", link: "https://github.com", content: "proj2")
p0 = Project.create!( name: "SolSys - A Math-Oriented Puzzle",
                      link: "https://solsys.xyz",
                      content: "A three year art project for the more mathematically reclined."
                    )
p1 = Project.create!( name: "Jobber - A Job Tracker",
                      link: "https://github.com/andmikey/jobber",
                      content: "Helps you keep track of multiple jobs while on a job hunt. Originally made for a hackathon. Uses React for the UI, Ruby on Rails for the backend. Still a work in progress."
                    )
p2 = Project.create!( name: "Haskulate - Quick Haskell Calculations",
                      link: "https://github.com/dylan-thinnes/haskulate",
                      content: "A one-day shell scripting project to make very quick, in-terminal calculations using the full potential of the Haskell standard library. Uses cat and the Glasgow Haskell Compiler."
                    )
p3 = Project.create!( name: "Domainatrix - Domains for the Soul",
                      link: "https://domainatrix.me",
                      content: "Cataloguing the nightmare that is the University of Edinburgh's DNS, one step at a time. Peruse the catalogue, Make your own submissions, and see the ping and http statuses of different domains' resolved addresses."
                    )
p4 = Project.create!( name: "SVGtoJS - A Space-Saving Sprite Generator",
                      link: "svgtojs.github.io",
                      content: " Converts SVG files into a series of drawing commands to a canvas. Saves a good deal of space when you need svgs on bitmaps and want to able to modify their attributes quickly, such as stroke and fill color."
                    )
p5 = Project.create!( name: "youtube-archive - A youtube-dl Mod",
                      link: "https://github.com/dylan-thinnes/youtube-archive",
                      content: " Wraps youtube-dl in helper functions which facilitate multiple simulatneous downloads and remember which videos you've already downloaded. This improves on youtube-dl's name-collision approach to download decisions."
                    )
p6 = Project.create!( name: "trump-or-not - A Twitter Game",
                      link: "https://trump-or-not.net",
                      content: "A fun little site, it show you a tweet and you have to guess if Trump said it or not. Try your luck and see how others fared. Please note I'm not very political in nature, it's more an attempt at a game than anything else.",
                    )
p7 = Project.create!( name: "Word of the Lord - Bringing Stallman to You",
                      link: "https://github.com/andmikey/created/blob/master/app.py",
                      content: " A completely free and open source hardware/software hack. At the press of a button, reads you a random Richard Stallman quote. Won the Github 'Spirit of the Hack' award. Run on a Raspberry Pi, using Wikiquotes and espeak."
                    )
p8 = Project.create!( name: "SlightlyBetterLectures - Lectures for UoE Students",
                      link: "https://lectures.dylant.org/",
                      content: "A lecture hosting site for fellow University of Edinburgh students. Now deprecated due to legal concerns."
                    )
p9 = Project.create!( name: "me-two - This Site!",
                      link: "https://dylant.org",
                      content: "A site that can double as a project listing, a contact page, and a blog. Built on rails, nice and lightweight, and completely no-JS compatible."
                    )
