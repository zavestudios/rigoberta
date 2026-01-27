if defined?(Prometheus::Client)
    require 'fileutils'
    multiprocess_files_dir = Rails.root.join('tmp', 'prometheus_metrics')
    FileUtils.mkdir_p(multiprocess_files_dir)
    Prometheus::Client.config.data_store = Prometheus::Client::DataStores::DirectFileStore.new(dir: multiprocess_files_dir)
  end
