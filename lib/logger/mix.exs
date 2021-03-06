defmodule Logger.Mixfile do
  use Mix.Project

  def project do
    [
      app: :logger,
      version: System.version,
      build_per_environment: false
    ]
  end

  def application do
    [
      registered: [Logger, Logger.Supervisor, Logger.Watcher],
      mod: {Logger.App, []},
      env: [
        level: :debug,
        utc_log: false,
        truncate: 8096,
        backends: [:console],
        translators: [{Logger.Translator, :translate}],
        sync_threshold: 20,
        handle_otp_reports: true,
        handle_sasl_reports: false,
        compile_time_purge_level: :debug,
        compile_time_application: nil,
        discard_threshold_for_error_logger: 500,
        translator_inspect_opts: [],
        console: []
      ]
    ]
  end
end
