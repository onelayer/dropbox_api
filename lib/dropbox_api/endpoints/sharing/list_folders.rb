module DropboxApi::Endpoints::Sharing
  class ListFolders < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/sharing/list_folders".freeze
    ResultType  = DropboxApi::Results::SharingListFoldersResult
    ErrorType   = DropboxApi::Errors::ListFolderError

    include DropboxApi::Endpoints::OptionsValidator

    # Returns a list of shared folders.
    #
    # @param limit [Integer] he maximum number of results to return per
    # request. The default for this field is 1000
    # @option actions [Array] A list of `FolderAction`s corresponding to
    # `FolderPermission`s that should appear in the response's
    # SharedFolderMetadata.permissions field describing the actions the
    # authenticated user can perform on the folder. This field is optional.
    add_endpoint :list_folders do |options = {}|
      validate_options([
        :limit,
        :actions
      ], options)
      options[:limit] ||= 1000
      options[:actions] ||= []

      perform_request options
    end
  end
end
