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

public class WingpanelIndicatorBup.Widgets.SnoozeBackupSwitch : Wingpanel.Widgets.Container {
    public new signal void switched ();

    private Gtk.Label switch_label;
    private Gtk.Label switch_description;
    private Gtk.Switch snooze_switch;
    private Gtk.Revealer description_revealer;

    private const string SWITCH_CSS = """
        .compact-switch-labels label {
            padding-bottom: 0;
            padding-top: 0;
        }
    """;

    public bool active {
        get {
            return snooze_switch.active;
        } set {
            snooze_switch.active = value;
            description_revealer.reveal_child = value;
            switched ();
        }
    }

    public string description {
        set {
            switch_description.label = "<small>%s</small>".printf (Markup.escape_text (value));
        }
    }

    public SnoozeBackupSwitch (string label, string description, bool active = false) {
        switch_label = new Gtk.Label (label);
        switch_label.halign = Gtk.Align.START;
        switch_label.valign = Gtk.Align.END;
        switch_label.margin_start = 6;
        switch_label.margin_end = 6;
        switch_label.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        switch_description = new Gtk.Label ("<small>%s</small>".printf (Markup.escape_text (description)));
        switch_description.use_markup = true;
        switch_description.halign = Gtk.Align.START;
        switch_description.margin_start = 6;
        switch_description.margin_end = 6;
        switch_description.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);

        snooze_switch = new Gtk.Switch ();
        snooze_switch.active = active;
        snooze_switch.halign = Gtk.Align.END;
        snooze_switch.hexpand = true;
        snooze_switch.margin = 3;
        snooze_switch.margin_end = 6;
        snooze_switch.valign = Gtk.Align.CENTER;

        description_revealer = new Gtk.Revealer ();
        description_revealer.valign = Gtk.Align.CENTER;
        description_revealer.add (switch_description);

        content_widget.attach (switch_label, 0, 0, 1, 1);
        content_widget.attach (switch_description, 0, 1, 1, 1);
        content_widget.attach (snooze_switch, 1, 0, 1, 2);
        content_widget.get_style_context ().add_class ("compact-switch-labels");

        var provider = new Gtk.CssProvider ();
        try {
            provider.load_from_data (SWITCH_CSS, SWITCH_CSS.length);
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        } catch (Error e) {
            critical (e.message);
        }

        clicked.connect (() => {
            active = true;
            snooze_switch.activate ();
        });

        snooze_switch.bind_property ("active", this, "active", GLib.BindingFlags.DEFAULT);
    }

    public Gtk.Switch get_switch () {
        return snooze_switch;
    }

}
