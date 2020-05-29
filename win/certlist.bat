@echo off

REM Script for check list certificates (via CryptoPro CSP).
REM Subject and KeyID of certificates are saving in 'certs.txt'
REM Copyright (C) 2020 Korneechev Evgeniy <ek@myconnector.ru>

REM This program is free software: you can redistribute it and/or modify it under
REM the terms of the GNU General Public License as published by the Free Software
REM Foundation, either version 2 of the License.
REM
REM This program is distributed in the hope that it will be useful, but WITHOUT
REM ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
REM FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
REM details.
REM
REM You should have received a copy of the GNU General Public License along with
REM this program. If not, see http://www.gnu.org/licenses/.

chcp 1251 > nul
"C:\Program Files\Crypto Pro\CSP\certmgr.exe" --list | findstr "Subj after" > certs.txt
echo Subject and KeyID of certificates saved in 'certs.txt'.
FOR /F "usebackq" %%a IN (`type certs.txt ^| findstr Subject ^| find /v /c ""`) DO (
 set result=%%a
)
echo Number of certificates: %result%
