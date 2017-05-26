module DropboxApi::Results
  class SharingListFoldersResult < DropboxApi::Results::Base
    # A collection of shared folders
    def entries
      @entries ||= @data["entries"].map do |entry|
        DropboxApi::Metadata::SharedFolder.new entry
      end
    end

    # Pass the cursor into `list_folder_continue` to see what's changed in the
    # folder since your previous query.
    def cursor
      @data["cursor"]
    end

    def has_more?
      !cursor.nil?
    end
  end
end
