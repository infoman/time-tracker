# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'testpassword' }

    trait :manager do
      role { :manager }
    end

    trait :admin do
      role { :admin }
    end

    # Not using just `profile` because it fails to validate somehow
    after :build do |user|
      build :profile, user: user
    end
  end
end
