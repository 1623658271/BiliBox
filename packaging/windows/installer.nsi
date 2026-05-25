!include "MUI2.nsh"

!ifndef APP_VERSION
  !define APP_VERSION "1.0.0"
!endif
!ifndef SOURCE_DIR
  !define SOURCE_DIR "..\..\dist_windows"
!endif
!ifndef OUTPUT_FILE
  !define OUTPUT_FILE "..\..\Bilibili_Box-installer.exe"
!endif
!ifndef ICON_SOURCE
  !define ICON_SOURCE "..\..\src-tauri\icons\icon.ico"
!endif

!define APP_NAME "Bilibili_Box"
!define DISPLAY_NAME "Bilibili Box"
!define APP_EXE "Bilibili_Box.exe"
!define REG_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"

Unicode true
Name "${DISPLAY_NAME}"
OutFile "${OUTPUT_FILE}"
InstallDir "$LocalAppData\Programs\${APP_NAME}"
InstallDirRegKey HKCU "${REG_KEY}" "InstallLocation"
RequestExecutionLevel user
SetCompressor /SOLID lzma

!define MUI_ABORTWARNING
!define MUI_ICON "${ICON_SOURCE}"
!define MUI_UNICON "${ICON_SOURCE}"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "English"

Section "Bilibili Box" SecMain
  SetOutPath "$INSTDIR"
  File /r "${SOURCE_DIR}\*"
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  CreateDirectory "$SMPROGRAMS\${DISPLAY_NAME}"
  CreateShortcut "$SMPROGRAMS\${DISPLAY_NAME}\${DISPLAY_NAME}.lnk" "$INSTDIR\${APP_EXE}"
  CreateShortcut "$SMPROGRAMS\${DISPLAY_NAME}\卸载 ${DISPLAY_NAME}.lnk" "$INSTDIR\Uninstall.exe"
  WriteRegStr HKCU "${REG_KEY}" "DisplayName" "${DISPLAY_NAME}"
  WriteRegStr HKCU "${REG_KEY}" "DisplayVersion" "${APP_VERSION}"
  WriteRegStr HKCU "${REG_KEY}" "DisplayIcon" "$INSTDIR\${APP_EXE}"
  WriteRegStr HKCU "${REG_KEY}" "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "${REG_KEY}" "UninstallString" "$INSTDIR\Uninstall.exe"
  WriteRegDWORD HKCU "${REG_KEY}" "NoModify" 1
  WriteRegDWORD HKCU "${REG_KEY}" "NoRepair" 1
SectionEnd

Section "Uninstall"
  Delete "$SMPROGRAMS\${DISPLAY_NAME}\${DISPLAY_NAME}.lnk"
  Delete "$SMPROGRAMS\${DISPLAY_NAME}\卸载 ${DISPLAY_NAME}.lnk"
  RMDir "$SMPROGRAMS\${DISPLAY_NAME}"
  RMDir /r "$INSTDIR"
  DeleteRegKey HKCU "${REG_KEY}"
SectionEnd
