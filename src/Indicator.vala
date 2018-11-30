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

public class WingpanelIndicatorBup.Indicator : Wingpanel.Indicator {
    /* The icon shown in the panel. */
    private Wingpanel.Widgets.OverlayIcon display_widget;

    /* A widget to display when the indicator icon is clicked. */
    private WingpanelIndicatorBup.Widgets.PopoverWidget? popover_widget = null;

    /* The state of the backup system this indicator is indicating. */
    public WingpanelIndicatorBup.BackupState backup_state { get; set; default = BackupState.IDLE; }

    public Indicator () {
        Object (
            code_name: "wingpanel-indicator-bup",
            display_name: _("Bup backup system"),
            description:_("A backup system indicator for Bup")
        );
    }

    public override Gtk.Widget get_display_widget () {
        if (display_widget == null) {
            display_widget = new Wingpanel.Widgets.OverlayIcon (backup_state.getIconName());
        }

        return display_widget;
    }

    public override Gtk.Widget? get_widget () {
        if (popover_widget == null) {
            popover_widget = new WingpanelIndicatorBup.Widgets.PopoverWidget (this);
        }

        return popover_widget;
    }

    public override void opened () { }

    public override void closed () { }
}

public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
    // Temporal workarround for Greeter crash
    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
        return null;
    }

    debug ("Activating wingpanel-indicator-bup widget");

    var indicator = new WingpanelIndicatorBup.Indicator ();
    return indicator;
}
