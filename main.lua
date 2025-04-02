require "ui"

local win=ui.Window("Reference Apa Constructor-- Tesis", "fixed",ancho, alto)
win.bgcolor=0XFFFFFFFF
win.width=1100
win.height=800
local ancho= win.width
local alto= win.height

local label01= ui.Label(win, "Nombre Completo del Autor:", (ancho/2)-200, 50)
label01.font="Roboto"
label01.fontsize=11

local entrada01= ui.Entry(win, "Apellido, Nombre",(ancho/2),50-1,150,25)

local label02= ui.Label(win, "Año:", (ancho/2)-100,100)
label02.font="Roboto"
label02.fontsize=11

local entrada02=ui.Entry(win, "Año", (ancho/2),100-4,150,25)

local title = ui.Label(win, "Titulo:", (ancho/2-100),150)
title.font="Roboto"
title.fontsize=11

local entrada03= ui.Entry(win, "Titulo", (ancho/2),150-4,150,25)

local EspTesis= ui.Label(win, "Especificaciones de Tesis: ",(ancho/2)-200, 200)
EspTesis.font="Roboto"
EspTesis.fontsize=11

local entraesp= ui.Entry(win,"Tesis de XX, Universidad XX", (ancho/2),200,150,25)

local Repositorio= ui.Label(win, "Repositorio:",(ancho/2)-100,250)
Repositorio.font="Roboto"
Repositorio.fontsize=11

local entryRepositorio=ui.Entry(win,"Repositorio", (ancho/2),250,150,25)


 local panel= ui.Panel(win, (ancho/2)-250, 370,1100,800)
  panel.bgcolor=0xFFFFFFF
  
local label02_primero=ui.Label(panel, "",0,0)
  label02_primero.font="Roboto"
 
 local label02_year=ui.Label(panel, "", 0,0)
 label02_year.font="Roboto"
local label02_title= ui.Label(panel, "",0 ,0)
label02_title.font="Roboto Italic"

local label02_EspTesis=ui.Label(panel, "",0,0)
label02_EspTesis.font="Roboto"
local label_Repositorio=ui.Label(panel, "", 0, 0)
label_Repositorio.font="Roboto"

local button=ui.Button(win, "Cita Apa para Tesis",(ancho/2)-100,300)
local buttoneraser=ui.Button(win, "Borrar", (ancho/2)+100,300)

function button:onClick()
  text_name= entrada01.text
  
  local palabras={}
  
for palabra in string.gmatch(text_name, "%S+")do
  table.insert(palabras, palabra)
end

function extension(palabras)
  if #palabras==4 then
    primer, segundo, tercer, cuarto= palabras[1], palabras[2], palabras[3], palabras[4]
    primer_littera= string.sub(primer, 1,1)
    segundo_littera=string.sub(segundo,1,1)
    lettra= string.format("%s %s, %s.%s.", tercer, cuarto, primer_littera,segundo_littera)
    
  elseif #palabras == 3 then
    primer, segundo, tercer= palabras[1], palabras[2], palabras[3]
    primer_littera= string.sub(primer, 1,1)
    lettra= string.format("%s, %s.", tercer, primer_littera)
    
  elseif #palabras == 2 then
    primer, segundo = palabras[1], palabras[2]
    primer_littera = string.sub(primer,1,1)
    lettra= string.format("%s, %s.", segundo, primer_littera)
  elseif #palabras == 1 then
    primer= palabras[1]
    lettra= string.format("%s.", primer)
    end
  
  end
extension(palabras)

    label02_primero.text= lettra
 label02_year.text= string.format("(%s).", entrada02.text)
 label02_year.x=label02_primero.width+5
 label02_title.text=string.format(" %s.", entrada03.text)
 label02_title.x= label02_primero.width+ label02_year.width+5
 label02_EspTesis.text=string.format("[%s] ", entraesp.text)
 label02_EspTesis.x= label02_primero.width+ label02_year.width+ label02_title.width+5
 label_Repositorio. text= string.format("%s.", entryRepositorio.text)
 label_Repositorio.x= label02_primero.width+label02_year.width+label02_title.width+label02_EspTesis.width+5

  end

function buttoneraser:onClick()
  entrada01.text=""
  entrada02.text=""
  entrada03.text=""
  entraesp.text=""
  entryRepositorio.text=""
  
  label02_primero.text= ""
 label02_year.text= ""
 label02_title.text=""
 label02_EspTesis.text=""
 label_Repositorio. text= ""


  
  end




ui.run(win):wait()
