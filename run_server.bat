@echo off
title MediQueue Development Server
echo ===================================================
echo Starting MediQueue Server on http://127.0.0.1:8000
echo Press Ctrl+C to stop the server
echo ===================================================
"C:\Users\Himanshu Choudhary\AppData\Local\Python\pythoncore-3.14-64\python.exe" manage.py runserver 127.0.0.1:8000
pause
