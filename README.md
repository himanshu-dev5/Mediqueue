# MediQueue — Smart Hospital Queue Management System

A production-style, multi-role hospital queue management web application engineered with Django 6, custom modern CSS design system, and real-time live queue tracking. Built with an editorial healthcare SaaS aesthetic (dark navy `#090D16`, deep teal `#0D9488`, and mint green `#10B981`).

---

## 📸 Design Vision & UI Mockup Matrix

The application faithfully implements all 14 core interface panels designed for modern clinical operations:

| # | Panel Name | URL | Description |
|---|---|---|---|
| 1 | **Cinematic Homepage** | `/` | Hero section with looping hospital lobby video, fallback image, feature strip, department previews, and doctor showcase. |
| 2 | **Role Selection** | `/accounts/role-select/` | 3 interactive cinematic cards for **Patient**, **Doctor**, and **Receptionist**. |
| 3 | **Split-Screen Login** | `/accounts/login/` | Atmospheric visual panel, password eye reveal, remember me, quick 1-click demo logins. |
| 4 | **Patient Dashboard** | `/patient/dashboard/` | Healthcare summary metrics, next appointment card with token, live queue widget. |
| 5 | **Book Appointment** | `/appointments/book/` | 4-step wizard: 1. Department &rarr; 2. Doctor &rarr; 3. Date & Time &rarr; 4. Confirm & Issue Token. |
| 6 | **Live Queue Tracking** | `/patient/queue/` | Now Serving card, Your Token, Patients Ahead, Estimated Wait Time, Today's Queue table, and real-time feed with auto-polling. |
| 7 | **Doctor Dashboard** | `/doctor/dashboard/` | Today's appointments, patients waiting, completed consultations, live queue table, and active patient side panel. |
| 8 | **Doctor Schedule** | `/doctor/schedule/` | Filter tabs (All, Upcoming, In Consultation, Completed), date picker, and queue action buttons. |
| 9 | **Receptionist Dashboard**| `/staff/dashboard/` | Hospital operations overview, department queue status table, and operational quick actions. |
| 10| **Department Directory** | `/departments/` | Public directory of specialized departments with search and doctor count. |
| 11| **Doctor Directory** | `/doctors/` | Public directory with department filter, experience, ratings, and instant booking. |
| 12| **My Appointments** | `/patient/appointments/` | Upcoming, past, and cancelled appointment cards with reschedule and cancellation workflows. |
| 13| **Medical History** | `/patient/medical-history/` | Confidential past consultations, clinical diagnoses, physician notes, and prescription reports modal. |
| 14| **Notifications Center**| `/notifications/` | Categorized in-app alerts (Appointments, Queue Updates, System) with unread state indicators. |
| * | **Public Queue Monitor** | `/queue/live/` | Full-screen waiting-hall television monitor with large Now Serving displays and live clock. |

---

## 🔑 Demo Accounts for Immediate Testing

Use these pre-configured credentials to evaluate role-specific dashboards:

| Role | Username / Email | Password | Landing Portal |
|---|---|---|---|
| **Patient** | `patient@mediqueue.com` | `patient123` | `/patient/dashboard/` |
| **Doctor** | `doctor@mediqueue.com` | `doctor123` | `/doctor/dashboard/` |
| **Receptionist** | `staff@mediqueue.com` | `staff123` | `/staff/dashboard/` |
| **Super Admin** | `admin@mediqueue.com` | `admin123` | `/admin/` |

---

## 🏗️ System Architecture

```
Mediqueue/
├── accounts/               # Custom User model, PatientProfile, DoctorProfile, ReceptionistProfile, decorators, role views
├── departments/            # Department models, doctor listings, public directories
├── appointments/           # Appointment booking wizard, slot availability calculation, cancellations
├── queue_management/       # Atomic sequential token issuance, status transitions, JSON polling API, audit logs
├── medical_records/        # Consultation records, diagnoses, prescription items
├── notifications/          # In-app notifications engine and navbar context processor
├── mediqueue_project/      # Settings, root URLs, WSGI/ASGI configuration
├── static/
│   ├── css/mediqueue.css   # MediQueue design system (dark navy, teal, mint palette, glassmorphism)
│   ├── js/mediqueue.js     # Live queue polling, audio chime alert, wizard slot picker, role card selector
│   ├── images/             # Hospital lobby photography fallback
│   └── videos/             # Looping hospital lobby video clip
└── templates/              # Semantic HTML5 templates styled with Bootstrap 5 + custom CSS
```

---

## 🚀 Quickstart & Installation

### 1. Prerequisites
- Python 3.10+ (tested on Python 3.14)
- Git (optional)

### 2. Environment Setup
```powershell
# Copy environment configuration
Copy-Item .env.example .env

# Install dependencies
pip install django pillow python-dotenv
```

### 3. Database Migrations
```powershell
python manage.py makemigrations accounts departments appointments queue_management medical_records notifications
python manage.py migrate
```

### 4. Seed Realistic Demonstration Data
Populate 8 medical departments, 4 specialized doctors, demo patients, today's queue sequence (`G-010` to `G-015`), medical history records, and notifications:
```powershell
python manage.py seed_data
```

### 5. Run Automated Test Suite
Execute the 18 automated test cases covering authentication, role redirects, unauthorized permission enforcement, booking conflicts, sequential token generation, and medical record privacy:
```powershell
python manage.py test
```

### 6. Start the Local Development Server
```powershell
python manage.py runserver
```
Visit **`http://127.0.0.1:8000/`** in your browser.

---

## 🛡️ Security & Privacy Guarantees
- **Strict Role-Based Access Control**: Server-side view decorators (`@patient_required`, `@doctor_required`, `@receptionist_required`) verify user roles from the authenticated session, preventing unauthorized horizontal and vertical privilege escalation.
- **Patient Confidentiality**: Patients are strictly restricted to their own appointments, medical diagnoses, and prescriptions.
- **Atomic Queue Concurrency**: Queue sequence incrementation and token numbers (e.g. `G-015`) are wrapped in database transactions to prevent collisions or duplicate active tokens.
