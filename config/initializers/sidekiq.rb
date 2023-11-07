Sidekiq.configure_server do |config|
    Yabeda::Prometheus::Exporter.start_metrics_server! if defined?(Yabeda::Prometheus::Exporter) # configure the prometheus metric server
end