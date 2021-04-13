program WRP2MRLN;

uses dos, os2def, os2base, Use32, crt;
var
cont,x,y,xy,yy : integer;
rc,ver: word;
chivo,archivo : array [1..8] of pChar;
ch, archivoStr : array [1..8] of string;
Backstr,CC,UNZ,RSP,RSR,Trash,bmp,dll,dat,rc2,res,nul:string;
Back : pChar;

procedure print(col,row:integer; mens:string);
begin
        gotoxy(col,row);
        write(mens);
end;

function met(xy:integer):string;
begin
  if xy < 0 then begin;
        print(16,19,'Û');
        print(16,20,'Û');
  end;
  x := (16 + (0 * xy));
  y := (16 + (6 * (1 + xy)));
  textcolor(White);
  print(14,18,'ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ');textcolor(black);print(67,18,'Ü');textcolor(white);
  print(14,19,'Û');                                   print(66,19,'Û');textcolor(black);print(67,19,'Û');textcolor(white);
  print(14,20,'Û');                                   print(66,20,'Û');textcolor(black);print(67,20,'Û');textcolor(white);
  print(14,21,'Û 00ÄÄÄÄÄÄÄÄÄÄ25ÄÄÄÄÄÄÄÄÄÄ50ÄÄÄÄÄÄÄÄÄ75ÄÄÄÄÄÄÄÄÄ100 Û');textcolor(black);print(67,21,'Û');textcolor(white);
  print(14,22,'ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ');textcolor(black);print(67,22,'Û');textcolor(black);
  print(14,23,' ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß');
  textcolor(yellow);
  while x < y do
    begin
        print(x,19,'Û');
        print(x,20,'Û');
        x:= x+1;
    end;
end;

procedure limpia;
begin
  x := 16;
  while x < 66 do
    begin
        print(x,19,' ');
        print(x,20,' ');
        x:= x+1;
    end;
end;

procedure error1;
begin
        textcolor(green);
        print(10,25,'No se puede respaldar el archivo '+ archivostr[cont]);
        textcolor(yellow);
end;

procedure respalda;
begin
        textcolor(yellow);
        print(14,17,'Preparando archivos...');
        Exec(GETENV('COMSPEC'), cc + ' UNPACK BUNDLE ' + nul);
        MkDir(backStr);
        print(09,15,'Los Archivos de respaldo seran guardados en '+ backstr);
        print(14,17,'Respaldando el archivo');
        cont := 1;
        while cont <= 8 do
             begin
             print(37,17,archivoStr[cont]);
             rc := doscopy (archivo[cont], BACK,0);
             yy := -1;
             met(yy + cont);
             if rc <> 0 then
                  begin
                  error1;
             end;
             cont := cont + 1
        end;
end;

procedure cambia;
var
dir:String ;

begin
   textcolor(yellow);
   getdir(0,dir);
   print(09,15,'Los archivos a modificar seran copiados temporalmente:       ');
   print(14,16,DIR);
   print(14,17,'Modificando archivo');
   cont := 1;
   while cont <= 8 do
        begin
        print(36,17,archivoStr[cont]);
        yy := -2;
        met (yy + cont);
        rc := doscopy (archivo[cont],'.',0);
        if rc <> 0 then
                begin
                error1;
        end;
        Exec(GETENV('COMSPEC'), cc + unz + ch[cont] + dat + nul);
        Exec(GETENV('COMSPEC'), cc + rsp + ch[cont] + rc2 + nul + ' && ' + rsr + ch[cont] + dll + ch[cont] + res + nul);
        Exec(GETENV('COMSPEC'), cc + Trash );
        if cont = 3 then
           begin
           Exec(GETENV('COMSPEC'), cc + bmp );
        end;
        yy := -1;
        met (yy + cont);
        cont := cont + 1
    end;
end;


procedure reemplaza;
begin
        print(09,15,'    Los archivos viejos seran reemplzados por los nuevos.      ');
        cont := 1;
        while cont <= 8 do
           begin
           yy := -2;
           met(yy + cont);
           print(14,17,'Remplazando...'+archivostr[cont]+'                      ');
           GOTOXY(1,25);
           Exec(GETENV('COMSPEC'),cc +' UNLOCK '+ archivostr[cont] + nul);
           dosdelete(archivo[cont]);
           dosmove(chivo[cont],archivo[cont]);
           yy := -1;
           met (yy + cont);
           cont := cont + 1
        end;
end;

procedure comprime;
begin
        print(09,15,'    Los archivos viejos seran comprimidos.                  ');
        cont := 1;
        while cont <= 8 do
           begin
           yy := -2;
           met(yy + cont);
           print(14,17,'Comprimiendo...'+Archivostr[cont]+'                      ');
           GOTOXY(1,25);
           Exec(GETENV('COMSPEC'), cc +' lxlite '+ archivostr[cont] + nul);
           yy := -1;
           met (yy + cont);
           cont := cont + 1
        end;
end;

procedure marco;
begin
  x := 1;
  while x < 81 do  {Imprime los lados del marco}
    begin
        print(x,01,'Û');
        print(x,24,'Û');
        x:= x+1;
    end;
  y := 1;
  while y < 24 do  {Imprime las lineas de arriba y abajo del marco}
    begin
        print(01,y,'Û');
        print(80,y,'Û');
        y:= y+1;
    end;
end;
procedure Warp;
  begin
  textcolor(lightgray);
  clrscr;
  marco;
  textcolor(white);
  y := 4;
  while y < 10 do  {Imprime las lineas de arriba y abajo del marco}
    begin
        print(12,y,'Û');
        print(69,y,'Û');
        y:= y+1;
    end;
  x := 12;
  while x < 70 do  {Imprime los lados del marco}
    begin
        print(x,04,'Ü');
        print(x,10,'ß');
        x:= x+1;
    end;
  textcolor(lightblue);
  textbackground(Black);
  print(13,05,'  ÜÜÜÜ   ÜÜÜÜ      Ü ÜÜÜÜÜ   ');
  print(13,06,' Û    Û Û    ß    Û  ß    Û  ');
  print(13,07,' Û    Û  ßßßßÜ   Û     ÜÛß   ');
  print(13,08,' Û    Û Ü    Û  Û    ÜÛß     ');
  print(13,09,'  ßßßß   ßßßß  ß     ßßßßßß  ');
  textcolor(lightred);
  print(41,05,' Ü     Ü  ÜÜÜÜ  ÜÜÜÜ  ÜÜÜÜ  ');
  print(41,06,' Û     Û Û    Û Û   Û Û   Û ');
  print(41,07,' ßÛ   Ûß ÛßßßßÛ ÛßÛß  Ûßßß  ');
  print(41,08,'  Û Û Û  Û    Û Û  Û  Û     ');
  print(41,09,'   ß ß   ß    ß ß   ß ß     ');
  textcolor(yellow);
  textbackground(blue);

end;


begin

{Cadenas para los mensajitos y las lineas de comandos.}

  dll  := '.DLL ';
  dat  := '.DAT ';
  rc2  := '.RC2 ';
  res  := '.RES ';
  nul  := ' > NUL ';
  ch[1] := ' PMVIOP';
  ch[2] := ' PMWP';
  ch[3] := ' PMMERGE';
  ch[4] := ' PMCTLS';
  ch[5] := ' IBMDEV32';
  ch[6] := ' WPCONFIG';
  ch[7] := ' WPPRTMRI';
  ch[8] := ' DSPRES';
  backStr := '\OS2\DLL\BACKUP';
  archivoStr[1] := '\OS2\DLL\PMVIOP.DLL  ';
  archivoStr[2] := '\OS2\DLL\PMWP.DLL    ';
  archivoStr[3] := '\OS2\DLL\PMMERGE.DLL ';
  archivoStr[4] := '\OS2\DLL\PMCTLS.DLL  ';
  archivoStr[5] := '\OS2\DLL\IBMDEV32.DLL';
  archivoStr[6] := '\OS2\DLL\WPCONFIG.DLL';
  archivoStr[7] := '\OS2\DLL\WPPRTMRI.DLL';
  archivoStr[8] := '\OS2\DLL\DSPRES.DLL  ';
  CC      := ' /C ';
  RSP     := ' RC -R ';
  RSR     := ' RESMGR -A ';
  UNZ     := ' UNZIP -o ';
  bmp     := ' DEL *.BMP /F > NUL';
  Trash   := ' DEL RES*.* /F > NUL && DEL *.RES /F > NUL && DEL *.RC2 /F > NUL ';

{Cadenas para las llamadas a OS/2.}

  back    := '\OS2\DLL\BACKUP';
  chivo[1] := 'PMVIOP.DLL';
  chivo[2] := 'PMWP.DLL';
  chivo[3] := 'PMMERGE.DLL';
  chivo[4] := 'PMCTLS.DLL';
  chivo[5] := 'IBMDEV32.DLL';
  chivo[6] := 'WPCONFIG.DLL';
  chivo[7] := 'WPPRTMRI.DLL';
  chivo[8] := 'DSPRES.DLL';
  archivo[1] := '\OS2\DLL\PMVIOP.DLL';
  archivo[2] := '\OS2\DLL\PMWP.DLL';
  archivo[3] := '\OS2\DLL\PMMERGE.DLL';
  archivo[4] := '\OS2\DLL\PMCTLS.DLL';
  archivo[5] := '\OS2\DLL\IBMDEV32.DLL';
  archivo[6] := '\OS2\DLL\WPCONFIG.DLL';
  archivo[7] := '\OS2\DLL\WPPRTMRI.DLL';
  archivo[8] := '\OS2\DLL\DSPRES.DLL';

{Aqui inicia el programa principal}

  viosetansi(1,0);
  textcolor(lightgray);
  textbackground(blue);
  ClrScr;
  marco;
  textcolor(yellow);
  print(27,7,'Este NO es un programa de:');
  textcolor(lightblue);
  print(17,09,'ßßßßßßßß   ßßßßßßßßßß     ßßßßßß       ßßßßßß');
  print(17,10,'ßßßßßßßß   ßßßßßßßßßßßß   ßßßßßßß     ßßßßßßß');
  print(17,11,'  ßßßß      ßßßß   ßßßß    ßßßßßßß   ßßßßßßß ');
  print(17,12,'  ßßßß      ßßßßßßßßßß     ßßßßßßßß ßßßßßßßß ');
  print(17,13,'  ßßßß      ßßßßßßßßßß     ßßßß ßßßßßßß ßßßß ');
  print(17,14,'  ßßßß      ßßßß   ßßßß    ßßßß  ßßßßß  ßßßß ');
  print(17,15,'ßßßßßßßß   ßßßßßßßßßßßß   ßßßßß   ßßß   ßßßßß');
  print(17,16,'ßßßßßßßß   ßßßßßßßßßß     ßßßßß    ß    ßßßßß');
  ver := dosversion;
  gotoxy(22,17);
  writeln('     para OS/2 versi¢n ', Lo(Ver) div 10, '.', Hi(Ver));
  textcolor(yellow);
  print(6,19,'Este programa *NO* esta sujeto a ninguna restricci¢n de Copyright');
  print(3,20,'salvo que no se borre, ni modifique mi nombre como autor original del mismo.');
  print(20,25,'Presione cualquier Tecla para Continuar.');
  repeat if readkey = #0 then readkey; until not keypressed;
  print(20,25,'                                        ');
  textcolor(lightgray);
  clrscr;
  marco;
  textcolor(lightred);
  print(07,03,'   AVISO: Este programa modificar  archivos (DLL) del sistema.');
  textcolor(yellow);
  print(07,04,'  Para reemplazar Iconos, Punteros, Botones de control, usando el');
  print(07,05,'manejador de recursos  (RESMGR.CMD, RDC.CMD, RDCPP.EXE) hecho por');
  print(07,06,'Martin Lafaix y  (UNLOCK.EXE, LXLITE.EXE) de Andrew Zabolotny con');
  print(07,07,'ayuda de FRIENDS  Software, (UNZIP.EXE) de Info-Zip, (UNPACK.EXE,');
  print(07,08,'RC.EXE) de IBM Corp.  de los cuales algunos ya vienen incluidos. ');
  print(07,10,'Sient se libre de distribuir este programa,  modificarlo pero s¡n');
  print(07,11,'cobrar por ‚l  ¢ cambiar, Borrar mi Nombre como Autor Original de');
  print(07,12,'este programa, La idea y  el Icono del Escritorio fue de parte de');
  print(07,13,'Alfonso Pesqueira R.(apocalps@teesa.com) la extracci¢n re-edici¢n');
  print(07,14,'de iconos y creaci¢n de este programa fue de parte de su servidor');
  print(07,15,'Marcos Francisco Caselin N. (salesman@m-net.arbornet.org) ah, por');
  print(07,16,'cierto, este es mi primer programa para OS/2 Woohoo!! =)');
  print(07,17,'Aclaro,  No me hago responsable de los da¤os que pueda causar por');
  print(07,18,'el mal manejo de este programa, se distribuye como es y tal cual.');
  print(07,20,'Se aceptan sugerencias y comentarios, iconos y donaciones =) ');
  print(07,21,'Todo sea por el Mejor Sistema Operativo Para PCs: OS/2');
  print(20,25,'Presione cualquier Tecla para Continuar.');
  repeat if readkey = #0 then readkey; until not keypressed;
  warp;
  print(20,25,'Presione cualquier Tecla para Continuar.');
  repeat if readkey = #0 then readkey; until not keypressed;
  print(20,25,'                                        ');
  respalda;
  print(14,17,'                                                       ');
  limpia;
  cambia;
  limpia;
  reemplaza;
  Exec(GETENV('COMSPEC'), cc + ' DEL *'+ dat + nul);
  limpia;
  comprime;
  clrscr;
  print(19,13,'Todo ha Transcurrido Sin Ning£n Problema');
  print(21,14,  'Ahora ya Puede Reiniciar el Sistema.');
  gotoxy(1,25);
end.
