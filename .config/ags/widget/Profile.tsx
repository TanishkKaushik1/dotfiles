import app from "ags/gtk3/app"
import { Astal, Gtk } from "ags/gtk3"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"

export default function Profile() {
  const title = createPoll(
    "Nothing playing",
    1000,
    "playerctl metadata --format '{{ title }}' 2>/dev/null || echo 'Nothing playing'"
  )

  const artist = createPoll(
    "",
    1000,
    "playerctl metadata --format '{{ artist }}' 2>/dev/null || echo ''"
  )

  return (
    <window
      name="profile"
      application={app}

      /* 🔥 THIS IS THE FIX */
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}

      layer={Astal.Layer.TOP}
      exclusivity={Astal.Exclusivity.IGNORE}

      /* ⬇️ push below Waybar */
      margin={[60, 20, 0, 0]}

      class="ProfileWindow"
    >
      {/* click outside → close */}
      <eventbox
        hexpand
        vexpand
        onButtonPressEvent={() => execAsync("ags toggle profile")}
      >
        {/* inner box stops propagation */}
        <eventbox>
          <box
            vertical
            spacing={16}
            widthRequest={320}
            halign={Gtk.Align.END}
            valign={Gtk.Align.START}
            class="panel-root"
          >
            <box class="panel-card" vertical spacing={12}>
              <label class="music-title" label={title} wrap />
              <label class="music-artist" label={artist} />

              <box spacing={18} halign={Gtk.Align.CENTER}>
                <button onClicked={() => execAsync("playerctl previous")}>
                  <label label="󰒮" />
                </button>
                <button onClicked={() => execAsync("playerctl play-pause")}>
                  <label label="󰐊" />
                </button>
                <button onClicked={() => execAsync("playerctl next")}>
                  <label label="󰒭" />
                </button>
              </box>
            </box>
          </box>
        </eventbox>
      </eventbox>
    </window>
  )
}
