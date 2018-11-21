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

public class WingpanelIndicatorBup.Widgets.PopoverWidget : Gtk.Grid {
    public unowned WingpanelIndicatorBup.Indicator indicator { get; construct set; }

    private WingpanelIndicatorBup.Widgets.SnoozeBackupSwitch snooze_switch;
    private Gtk.Label last_backup_label;
    private Gtk.ModelButton backup_now_button;
    private Gtk.ModelButton settings_button;

    public bool snoozed {
        set {
            snooze_switch.active = value;
        }
    }

    public PopoverWidget (WingpanelIndicatorBup.Indicator indicator) {
        Object (indicator: indicator);
    }

    construct {
        orientation = Gtk.Orientation.VERTICAL;

        snooze_switch = new WingpanelIndicatorBup.Widgets.SnoozeBackupSwitch (_("Snooze Backup"), _("Disabled until tomorrow"));

        last_backup_label = new Gtk.Label ("Last backup: unknown");

        backup_now_button = new Gtk.ModelButton ();
        backup_now_button.text = _("Backup now");
        backup_now_button.clicked.connect (backup_now);

        settings_button = new Gtk.ModelButton ();
        settings_button.text = _("Backup settings…");
        settings_button.clicked.connect (show_settings);

        add (snooze_switch);
        add (new Wingpanel.Widgets.Separator ());
        add (last_backup_label);
        add (backup_now_button);
        add (new Wingpanel.Widgets.Separator ());
        add (settings_button);

        snoozed = WingpanelIndicatorBup.BackupManager.get_instance ().snoozed;

        snooze_switch.get_switch ().bind_property ("active", WingpanelIndicatorBup.BackupManager.get_instance (), "snoozed", GLib.BindingFlags.DEFAULT);
    }

    private void backup_now () {
        // TODO.
    }

    private void show_settings () {
        // TODO.
    }
}
