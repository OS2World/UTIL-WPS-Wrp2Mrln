INTRODUCTION

  Wrp2Mrln provides a new apearance to the gracefull OS/2 Warp v3.0,
  replacing Folder icons, Pointers, warning dialog icons, spooler icons,
  also control buttons and the pretty (beauty is most acurate) WarpSans,
  WarpSans  Bold and New Font C ISO, from OS/2 Merlin. This program also
  includes 12 new icons, taken from OS/2 Merlin as well. Whit this changes,
  OS/2 will have a more satisfactory look.

INSTALLATION

  Files included in this release:
                WRP2MRLN.EXE    - program
                WRP2MRLN.PAS    - source code
                BUNDLE          - data files
                WRP2MRLN.RC     - rc file for new desktop
                CLOSE.BMP       - close bitmap for Xit
                NPSWPSCB.BMP    - close bitmap for NPS WPS
                LEAME.TXT       - this file, but in Spanish
                README.TXT      - this file
                HISTORIA.DOC    - changes history
                FILE_ID.DIZ             - description file for BBS's

  The Bunlde contains this files:
                +DSPRES.DAT     - dialog icons, mouse pointers and fonts
                +IBMDEV32.DAT   - dialog icons, mouse pointers and fonts
                +PMCTLS.DAT     - settings notebook's buttons
                +PMMERGE.DAT    - window's control button, and some icons
                +PMVIOP.DAT     - command line session's icons
               *+PMWP.DAT       - WPS icons, folder icons, etc.
                +WPCONFIG.DAT   - setup program's icons
                +WPPRTMRI.DAT   - spooler's job view icons

        * 12 cinons were added, taken from OS/2 Merlin Beta
        + All DAT files, are just ZIP files.

  External programs required:

        (RESMGR.ZIP, by Martin Lafaix - lafaix@alto.unice.fr)
                RESMGR.CMD      - resource manager
                RDCPP.EXE       - resources preprocesor-decompiler

        (LXLT115.ZIP, by Andrew Zabolotny and FRIENDS Software)
                UNLOCK.EXE      - file unlock program
                LXLITE.EXE      - EXE files compressor
                LXLITE.CFG      - LXLITE configuration file

        (UNZIP.EXE, by The InfoZIP Project)
                UNZIP.EXE       - just in case you don't have this program (but
                               I'm sure you got it, since you're reading this),
                               the UNZIP distribution file is in
                               hobbes.nmsu.edu/os2/archiver/unz512x2.exe

        (RC.EXE, UNPACK.EXE, *PACK.EXE, by MS and IBM Corp.)
                        RC.EXE                  - resources compiler
                        UNPACK.EXE              - Bundel files unpacker
                       *PACK.EXE                - file packer

                        * included in this package

  Copy the first 2 files (WRP2MRLN.EXE - BUNDLE) too any directory on your
  OS/2 boot drive, and the rest, to a directory in your PATH.

Using WRP2MRLN

  When you execute WRP2MRLN, the program will create a backup directory
  called "\OS2\DLL\BACKUP", and the files that'll be changed will be
  copied there before the modifications, so, if there's a power fail, or
  something, the original files are safe, and can be restored. Then, the
  files will be copied to the work directory (the one where WRP2MRNL is),
  the bundle file will be unpacked, and the program will change the
  resorurces. You will be informed of any part of the process, and the meter
  tell you the precentage of the work. The process cab be aborted by just
  press CTRL-C at any moment.

  This program was tested in a 486DX2/66, and used 6-7 minutes to do
  everything.

  Note: At the DLL compression, may appear the system hangs, but it doesn't,
  dont worry, be patient.

MODIFICATIONS

  This is the files that will be modified:

                             DSPRES.DLL
                             IBMDEV32.DLL
                             PMCTLS.DLL
                             PMMERGE.DLL
                             PMVIOP.DLL
                             PMWP.DLL
                             WPCONFIG.DLL
                             WPPRTMRI.DLL

  After all is is finished, you can reboot you computer, and then you will
  see some new icons on the desktop. No all icons are changed, to do this,
  you will need make another desktop. I suggest do this using the file
  WRP2MRLN.RC (with this command: MAKEINI INI.INI WRP2MRLN.RC). Then, you
  will have a new way to look OS/2 Warp.

PROBLEMS

  If you have some problem, suggestions, new icons, donations (thah will
  de destinated to buy some OS/2 proggraming books, since this program was
  made with a 5 yeas old INF), send it to:

          Francisco Caselin Nava  (programer of this stuff)
          salesman@m-net.arbornet.org (via Internet)

also

           Alfonso Pesqueria R. (the madman who think about this first time)
           apocalps@aurora,.teesa.com (via Internet)

  Send a detailed description of the trouble.

  If you want send e-snail (well, not everyone have Internet), the address
  is:

        Marcos Francisco Caselin Nava
        C.P.55070, Playa de Cuyutlan Mz.582 Lt.8 #43
        Colonia Jardines de Morelos
        Ecatepec, Estado de Mexico, Mexico

ABOUT...

  This program was written in Virtual Pascal 1.0 BETA (#003). BTW, this is
  my firts OS/2 Pascal program. All source code is included, and I'm
  planning to implement some things more, like a Backup Restorer, a
  text mode INI editor, a Windows RUN command clone (I NEED this thing),
  and I wat this program unlock a add the colors itself. Or some idea you
  have. Since vacatins are over, and I have to return to High School, I
  don't have much time for programming, but I can do something about it...=)

TRADEMARKS

  All trademarks and programs names are registered by it's owners.

DISCLAIMER

  This package is privided "AS IS", with no warranty at all. Francisco
  Caselin and Alfonso Pesqueira are not responsibles of any damage or loose
  this program may cause, be it finnancial, emotional, physical, marital,
  etc. If you turn mad after the use of this program, we're not give it
  to you! =)

Francisco Caselin (Author, Programmer)
Alfonso Pesqueira (Idea original, and [bad] English Translator)
1996, No rights reserved.
