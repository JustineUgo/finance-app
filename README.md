

# 💳 Finance app

This project is a two-screen Flutter app that displays a transaction summary and transaction detail page based on mock API data. It demonstrates clean UI replication, state management, and basic interaction logic.

---

## 🚀 Setup Instructions

1. **Clone the repo**:
   ```bash
   git clone https://github.com/JustineUgo/finance-app.git
   cd finance-app
    ````

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the app**:

   ```bash
   flutter run
   ```

> Make sure you have Flutter SDK installed and an emulator or device connected.

---

## 📦 Libraries Used

| Package                                    | Purpose                                           |
| ------------------------------------------ | ------------------------------------------------- |
| `fl_chart`                                 | For drawing the circular pie chart                |
| `fluttertoast` (optional)                  | For toast messages (alternative shown without it) |
| `flutter_bloc` | State management                                  |
| `animation_list` | For animating list of transactions                                  |
| `cached_network_image` | For loading and caching network images                                  |
| `dio` | Used to perform network calls                                  |
| `go_router` | Navigation solution                                  |

---

## 🧠 Design & State Management Decisions

* **UI Structure**: Built with composable widgets for reusability and clean layout.
* **Dropdown Selection**: Custom month selector using `PopupMenuButton` for visual styling.
* **State Management**: `Bloc` used to manage state of the whole application by adding events and emitting appropriate states.
* **Responsiveness**: The layout adjusts padding and sizing to support different screen sizes and orientations.

---

## 📡 Mock API Simulation

Mock data gotten from a mock api: `https://mocki.io/v1/f5d68536-1f58-4be5-8266-248b440503e2
`. The json response is parse on the bloc level and used in the application.

### Sample structure:

```json
[
  {
    "id": 1,
    "name": "Netflix Premium",
    "merchant": "Netflix",
    "amount": 1500,
    "status": "Success",
    "paymentMethod": "Card",
    "time": "2025-10-01T10:00:00Z"
  }
]
```

---

## 📽️ Demo Video

🎥 [Click to watch the demo](https://www.loom.com/share/29cab0cee80945849cdb951c2780cec3)

> This under-2-minute video shows:
>
> * The app running
> * How transactions are displayed
> * Filtering by month
> * The transaction detail page
> * The refund flow and feedback (toast/snackbar)

---

## 📝 Notes

* All transactions are filtered by the selected month.
* Refund logic updates the UI and disables the button.
* Pie chart displays transaction breakdown.

---

## ✅ Features

* Month-based filtering
* Custom dropdown styling
* Transaction list with icons and metadata
* Pie chart breakdown
* Detail page with status, refund button, and navigation

```
