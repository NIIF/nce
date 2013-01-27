
function mc/color() {
  case "${1:-light}" in
    blue)
      export MC_COLOR_TABLE="base_color=lightgray,blue:normal=lightgray,blue:selected=black,cyan:marked=yellow,blue:markselect=yellow,cyan:errors=white,red:menu=white,cyan:reverse=black,lightgray:dnormal=black,lightgray:dfocus=black,cyan:dhotnormal=blue,lightgray:dhotfocus=blue,cyan:viewunderline=brightred,blue:menuhot=yellow,cyan:menusel=white,black:menuhotsel=yellow,black:helpnormal=black,lightgray:helpitalic=red,lightgray:helpbold=blue,lightgray:helplink=black,cyan:helpslink=yellow,blue:gauge=white,black:input=black,cyan:directory=white,blue:executable=brightgreen,blue:link=lightgray,blue:stalelink=brightred,blue:device=brightmagenta,blue:core=red,blue:special=black,blue:editnormal=lightgray,blue:editbold=yellow,blue:editmarked=black,cyan:errdhotnormal=yellow,red:errdhotfocus=yellow,lightgray"
      ;;

    black1)
      export MC_COLOR_TABLE="base_color=cyan,gray:normal=gray,black:selected=cyan,gray:marked=brightcyan,gray:markselect=brightcyan,gray:directory=default,default:executable=lightgray,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=red,default:gauge=lightgray,default:input=white,gray:dnormal=gray,black:dfocus=brightcyan,gray:dhotnormal=brightcyan,black:dhotfocus=brightcyan,gray:menu=lightgrey,default:menuhot=brightcyan,gray:menusel=brightcyan,gray:menuhotsel=brightcyan,gray:helpnormal=lightgray,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default"
      ;;

    black2)
      export MC_COLOR_TABLE="base_color=lightgray,green:normal=green,default:selected=white,gray:marked=yellow,default:markselect=yellow,gray:directory=blue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default"
      ;;
    
    black3)
      export MC_COLOR_TABLE="base_color=lightgray,blue:normal=blue,default:selected=white,brightblue:marked=yellow,default:markselect=yellow,gray:directory=brightblue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default"
      ;;
    
    *|light)
      # http://ajurzyk.blogspot.hu/2010/06/midnight-commander-theme.html
      export MC_COLOR_TABLE="base_color=normal=lightgray,black:input=white,brightred:errors=white,brightred:gauge=yellow,red:selected=gray,lightgray:marked=yellow,black:markselect=yellow,brown:directory=white,black:executable=brightgreen,black:link=green,black:device=brightmagenta,black:special=brown,black:core=brightred,yellow:menu=gray,lightgray:menuhot=yellow,lightgray:menuhotsel=brightred,black:dnormal=white,gray:dfocus=white,brightgreen:dhotnormal=brightred,gray:dhotfocus=brightred,gray:editmarked=white,brightred:editnormal=white,black:editbold=blue,brown:reverse=yellow,black:helpnormal=white,black:helpitalic=brightmagenta,black:helpbold=brightcyan,black:helpslink=yellow,black:helplink=brightblue,black:viewunderline=brightgreen,white"
      ;;
  esac
}
