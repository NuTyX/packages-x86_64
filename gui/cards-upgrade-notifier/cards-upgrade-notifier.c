#include <libintl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <glib.h>
#include <gtk/gtk.h>

#define CUN_UPDATES_ICON  "/usr/share/pixmaps/cards-upgrade-notifier-updates.png"

struct cards_update_notifier {
    GtkStatusIcon *tray_icon;
    GdkPixbuf *updates_pixbuf;
    GtkWidget *menu;
};
static struct cards_update_notifier *cun = NULL;

static void set_working(void)
{
    gtk_status_icon_set_from_pixbuf(cun->tray_icon, cun->updates_pixbuf);
    gtk_status_icon_set_visible(cun->tray_icon, TRUE);
    while (gtk_events_pending())
        gtk_main_iteration();
}

static void set_hidden(void)
{
    gtk_status_icon_set_visible(cun->tray_icon, FALSE);
}

int tray_destroy(struct cards_update_notifier *cun)
{
    if (cun->updates_pixbuf)
        g_object_unref(G_OBJECT(cun->updates_pixbuf));

    g_object_unref(G_OBJECT(cun->tray_icon));
}


void tray_menu(GtkStatusIcon *status_icon, guint button, guint activate_time, gpointer data)
{
	gtk_main_quit();
}

void menuitem_hide_callback(GObject *g, void *data)
{
    set_hidden();
}
int main(int argc, char *argv[])
{
	gtk_init(&argc, &argv);
	cun = malloc(sizeof *cun);
	cun->updates_pixbuf = gdk_pixbuf_new_from_file(CUN_UPDATES_ICON, NULL);
	cun->tray_icon = gtk_status_icon_new();

	g_signal_connect(G_OBJECT(cun->tray_icon), "popup-menu", G_CALLBACK(tray_menu), NULL);

	set_working();

	cun->menu = gtk_menu_new();
	GtkWidget *hide_menuitem = gtk_menu_item_new_with_label("Hide");
	gtk_menu_shell_append(GTK_MENU_SHELL(cun->menu), hide_menuitem);
	g_signal_connect(G_OBJECT(hide_menuitem), "activate", G_CALLBACK(menuitem_hide_callback), NULL);
	gtk_widget_show_all(cun->menu);
	gtk_status_icon_set_tooltip_text(cun->tray_icon,"No upgrade available");
	if ( argv[1] != NULL ) {
		gtk_status_icon_set_tooltip_text(cun->tray_icon,"Updates are available");
		gtk_status_icon_set_from_pixbuf(cun->tray_icon, cun->updates_pixbuf);
    	gtk_status_icon_set_visible(cun->tray_icon, TRUE);
	}
	gtk_main();
	tray_destroy(cun);
	free(cun);
	return 0;
}
