module DropboxApi::Metadata
  class UserMembershipInfo < Base
    field :access_type, Hash
    field :user, DropboxApi::Metadata::Member
    field :permissions, Array, :optional
    field :is_inherited, :boolean
  end
end
