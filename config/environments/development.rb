require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.session_store :redis_session_store,
    key: "beast_mode_session_",
    serializer: :json,
    redis: {
      expire_after: 1.year,
      url: ENV.fetch("REDIS_URL") { "redis://127.0.0.1:6379/1" }
    }

  config.hosts << /[a-z0-9]+\.ngrok\.io/
  config.hosts << /[a-z0-9-]+\.ngrok-free\.app/

  config.log_level = :warn

  # Make code changes take effect immediately without server restart.
  config.enable_reloading = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing.
  config.server_timing = true

  config.action_controller.perform_caching = true
  config.action_controller.enable_fragment_cache_logging = true
  config.action_controller.default_url_options = {host: "localhost", port: 3000}

  config.cache_store = :redis_cache_store, {url: ENV.fetch("REDIS_URL") { "redis://127.0.0.1:6379/1" }}
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{2.days.to_i}"
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Highlight code that triggered redirect in logs.
  config.action_dispatch.verbose_redirect_logs = true

  # Annotate rendered view with file names.
  # Off: HTML comments before <tr> confuse Nokogiri HTML5 fragment inference used by SR morphs.
  config.action_view.annotate_rendered_view_with_filenames = false

  # Raise error when a before_action's only/except options reference missing actions.
  config.action_controller.raise_on_missing_callback_actions = true
end
