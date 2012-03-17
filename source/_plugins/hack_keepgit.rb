# Monkey Patch Jekyll not to delete the .git directory in the destination folder.
module Jekyll
    class Site
        def cleanup
          # all files and directories in destination, including hidden ones
          dest_files = Set.new
          Dir.glob(File.join(self.dest, "**", "*"), File::FNM_DOTMATCH) do |file|
            dest_files << file unless file =~ /\/\.{1,2}$/ || file =~ /\/\.git/
          end

          # files to be written
          files = Set.new
          self.posts.each do |post|
            files << post.destination(self.dest)
          end
          self.pages.each do |page|
            files << page.destination(self.dest)
          end
          self.static_files.each do |sf|
            files << sf.destination(self.dest)
          end

          # adding files' parent directories
          dirs = Set.new
          files.each { |file| dirs << File.dirname(file) }
          files.merge(dirs)

          obsolete_files = dest_files - files

          FileUtils.rm_rf(obsolete_files.to_a)
        end
    end
end