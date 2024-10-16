# SPDX-License-Identifier: BSD-2-Clause
#
# config.ru
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

require 'puma'
require './lib/slack_bot_app'
require_relative 'config/initializers/active_record_established'

use Rack::RewindableInput::Middleware

run Rack::URLMap.new('/' => SlackRubyBotServer::Api::Middleware.instance, '/github' => Server)
