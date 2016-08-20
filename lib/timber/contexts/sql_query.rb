module Timber
  module Contexts
    # Base class for SQLQuery sub types.
    class SQLQuery < Context
      ROOT_KEY = :sql_query.freeze
      VERSION = 1.freeze

      private
        def json_payload
          @json_payload ||= Core::DeepMerger.merge({
            _root_key => {
              :sql => sql,
              :time_ms => time_ms
            }
          }, super)
        end
    end
  end
end
