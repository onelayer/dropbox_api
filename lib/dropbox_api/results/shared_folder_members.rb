module DropboxApi::Results
  class SharedFolderMembers < DropboxApi::Results::Base
    def users
      @users ||= @data["users"].map do |user|
        DropboxApi::Metadata::UserMembershipInfo.new user
      end
    end

    def groups
      @data["groups"]
    end

    def invitees
      @data["invitees"]
    end

    def cursor
      @data["cursor"]
    end

    def has_more?
      !cursor.nil?
    end
  end
end
