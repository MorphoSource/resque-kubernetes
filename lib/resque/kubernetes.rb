# frozen_string_literal: true

require "retriable"

require "resque/kubernetes/configurable"
require "resque/kubernetes/context/kubectl"
require "resque/kubernetes/context/well_known"
require "resque/kubernetes/context_factory"
require "resque/kubernetes/deep_hash"
require "resque/kubernetes/dns_safe_random"
require "resque/kubernetes/job"
require "resque/kubernetes/jobs_manager"
require "resque/kubernetes/manifest_conformance"
require "resque/kubernetes/retriable_client"
require "resque/kubernetes/version"

module Resque
  # Run Resque Jobs as Kubernetes Jobs with autoscaling.
  module Kubernetes
    extend Configurable

    # By default, this plugin is not active.
    define_setting :enabled, false

    # Limit the number of workers that should be spun up, default 10
    define_setting :max_workers, 10

    # A `kubeclient` for connection context, default attempts to read from cluster or `~/.kube/config`
    define_setting :kubeclient, nil

    # Whether all API requests should be namespace scoped
    define_setting :namespace_scope_only, false
  end
end
