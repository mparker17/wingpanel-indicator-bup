/*-
 * Copyright (c) 2018 mparker17
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as published by
 * the Free Software Foundation, either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authored by: M Parker <mparker17@users.noreply.github.com>
 */

public class WingpanelIndicatorBup.BackupManager : Object {
    public signal void snooze_changed (bool value);

    private bool _snoozed = false;
    public bool snoozed {
        get {
            return _snoozed;
        } set {
            _snoozed = value;
            snooze_changed (value);
        }
    }

    public bool active {
        get;
    }

    static WingpanelIndicatorBup.BackupManager? instance = null;
    public static BackupManager get_instance () {
        if (instance == null) {
            instance = new BackupManager ();
        }

        return instance;
    }

    private BackupManager () {}

    construct {
        // TODO.
    }

    public void toggle_snooze () {
        snoozed = !snoozed;
    }
}
