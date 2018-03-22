require 'xcodeproj'
require 'fileutils'

swiftFiles = Dir.glob("*.swift")
generatedFolder = "generated"
FileUtils.rm_rf(generatedFolder)
dirname = File.basename(Dir.getwd)
Dir.mkdir generatedFolder
swiftFiles.each do |swiftFile| 
    FileUtils.cp(swiftFile, generatedFolder)
end
Dir.chdir generatedFolder

swiftFiles = Dir.glob("*.swift")
xcodeprojPath = dirname + ".xcodeproj"    
proj = Xcodeproj::Project.new(xcodeprojPath)


swiftFiles.sort.each do |swiftFile| 
    person = File.basename(swiftFile,".*")
    File.rename(swiftFile, "main.swift")
    Dir.mkdir(person)
    FileUtils.move("main.swift", person)
    filePath = person+"/main.swift"
    
    file_ref = proj.new_file(filePath)
    file_ref.name = "main.swift"

    group = proj.new_group(person,person)
    file_ref.move(group)
    file_ref.path = "main.swift"


    target = proj.new_target(:tool, person, :osx)
    target.product_type = "com.apple.product-type.tool"
    target.source_build_phase.add_file_reference(file_ref)
    target.build_settings("Debug")["SWIFT_VERSION"] = "4.0"
    target.build_settings("Release")["SWIFT_VERSION"] = "4.0"

    
    scheme = Xcodeproj::XCScheme.new()
    scheme.add_build_target(target)
    scheme.set_launch_target(target)
    scheme.save_as(xcodeprojPath, person)
end

proj.save()
