class MusicImporter
    attr_reader :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        Dir.children(self.path)
    end

    def import
        files.each { |file| Song.create_from_filename(file) }
    end

end