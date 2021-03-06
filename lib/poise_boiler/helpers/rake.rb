#
# Copyright 2015, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'halite/helper_base'


module PoiseBoiler
  module Helpers
    # Helper for a Rakefile to install common tasks for the Poise workflow.
    #
    # @since 1.0.0
    # @see Badges
    # @see Core
    # @see Travis
    class Rake < Halite::HelperBase
      autoload :Badges, 'poise_boiler/helpers/rake/badges'
      autoload :Core, 'poise_boiler/helpers/rake/core'
      autoload :Travis, 'poise_boiler/helpers/rake/travis'

      # Install all rake tasks.
      #
      # @return [void]
      def install
        Core.install(gem_name: gem_name, base: base, **options)
        Badges.install(gem_name: gem_name, base: base, **options)
        Travis.install(gem_name: gem_name, base: base, **options)
      end
    end
  end
end
