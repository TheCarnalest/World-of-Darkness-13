import icq from '../../assets/WindowsXP/icq.png';
import notepad from '../../assets/WindowsXP/327(32x32).png';
import error from '../../assets/WindowsXP/897(32x32).png';
import gmail from '../../assets/WindowsXP/gmail_icon.png';
import news from '../../assets/WindowsXP/news.png';
import { Notepad } from './Apps/Notepad';
import { ICQ } from './Apps/ICQ';
import { Error } from './Apps/Error';
import { Gmail } from './Apps/Gmail';
import { News } from './Apps/News';


export function GetIconByName(name) {
  switch (name) {
    case "icq":
      return icq
    case "notepad":
      return notepad
    case "error":
      return error
    case "gmail":
      return gmail
    case "news":
      return news
  }
}

export function GetAppByName(app, act) {
  switch (app.type) {
    case "icq":
      return <ICQ app={app} act={act} />
    case "notepad":
      return <Notepad app={app} act={act} />
    case "error":
      return <Error app={app} act={act} />
    case "gmail":
      return <Gmail app={app} act={act} />
    case "news":
      return <News app={app} act={act} />
  }
}
