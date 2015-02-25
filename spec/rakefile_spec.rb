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

require 'spec_helper'

describe 'poise_boiler/rakefile' do
  let(:rake_command) { '' }
  # NEXT STEP: set BUNDLE_GEMFILE to point at the project level gemfile, not the temp dir
  subject do
    Mixlib::ShellOut.new(
      "bundle exec rake #{rake_command}",
      cwd: temp_path,
      environment: {
        'BUNDLE_GEMFILE' => File.expand_path('../../Gemfile', __FILE__),
      },
    ).tap do |cmd|
      cmd.run_command
      cmd.error!
    end
  end

  file 'Rakefile', 'require "poise_boiler/rakefile"'
  file 'test.gemspec', <<-EOH
Gem::Specification.new do |spec|
  spec.name = 'test'
  spec.version = '1.0'
end
EOH

  describe 'list of tasks' do
    let(:rake_command) { '-T' }
    its(:stdout) { is_expected.to include('rake build') }
    its(:stdout) { is_expected.to include('rake chef:build') }
    its(:stdout) { is_expected.to include('rake chef:foodcritic') }
    its(:stdout) { is_expected.to include('rake chef:release') }
    its(:stdout) { is_expected.to include('rake install') }
    its(:stdout) { is_expected.to include('rake release') }
    its(:stdout) { is_expected.to include('rake spec') }
  end
end
