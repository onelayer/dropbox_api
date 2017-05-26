module DropboxApi::Endpoints::Sharing
  class ListFoldersContinue < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/sharing/list_folders/continue".freeze
    ResultType  = DropboxApi::Results::SharingListFoldersResult
    ErrorType   = DropboxApi::Errors::ListFolderError

    # Once a cursor has been retrieved from `list_folder`, use this to paginate
    # through all files and retrieve updates to the folder.
    #
    # @param cursor [String] The cursor returned by your last call to
    #   list_folder or list_folder_continue.
    add_endpoint :list_folders_continue do |cursor|
      perform_request :cursor => cursor
    end
  end
end
