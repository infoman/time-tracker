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

module ApplicationHelper
  ALERT_KEYS = {
    alert:  :danger,
    notice: :info
  }

  def alert_class(key)
    "alert alert-#{(ALERT_KEYS[key.to_sym] || key).to_s}"
  end

  def nav_active?(path)
    current_page?(path) ? 'active' : ''
  end
end
