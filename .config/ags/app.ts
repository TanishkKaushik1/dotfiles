import app from "ags/gtk3/app"
import style from "./style.scss"
import Profile from "./widget/Profile"

app.start({
  css: style,
  main() {
    return Profile()   // ← THIS IS THE FIX
  },
})
