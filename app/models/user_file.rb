class UserFile < ApplicationRecord
    belongs_to :folder
    def uploaded_file=(incoming_file)
        binding.pry 
        self.filename = incoming_file.values[0].original_filename 
        self.content_type = incoming_file.values[0].content_type
        self.data = incoming_file.values[0].tempfile
    end
end
