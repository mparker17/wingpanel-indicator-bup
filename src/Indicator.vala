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

public class Bup.Indicator : Wingpanel.Indicator {
    /* The drop-down that appears when you click on the display_icon. */
    private Gtk.Grid main_grid;

    /* The icon shown in the Wingpanel, i.e.: that a user clicks on. */
    private Gtk.Image display_icon;

    public Indicator () {
        Object (
            code_name: "wingpanel-indicator-bup",
            display_name: _("Bup backup system"),
            description:_("A backup system indicator for Bup")
        );
    }

    public override Gtk.Widget get_display_widget () {
        if (display_icon == null) {
            this.display_icon = new Gtk.Image.from_icon_name ("document-open-recent-symbolic", Gtk.IconSize.MENU);
        }

        return display_icon;
    }

    public override Gtk.Widget? get_widget () {
        if (main_grid == null) {
            main_grid = new Gtk.Grid ();
            main_grid.set_orientation (Gtk.Orientation.VERTICAL);

            main_grid.show_all ();
        }

        return main_grid;
    }

    public override void opened () { }

    public override void closed () { }
}

public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
    // Temporal workarround for Greeter crash
    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
        return null;
    }
    debug ("Activating mparker17 widget");
    var indicator = new Bup.Indicator ();
    return indicator;
}
