# Spurgeon 366 Morning Devotional Server

This is a simple backend for the **Spurgeon 366 Morning Devotional** Android App, designed to serve devotional data using static files hosted on GitHub.

Instead of using a paid or complex backend, this project utilizes GitHub's raw file infrastructure as a free, version-controlled, API-like source.

<br />

## 📂 Project Structure

```text
├── 01-jan/
│   ├── 0101.md            # Devotional for Jan 1st
│   ├── 0102.md
│   └── ...
├── 02-feb/
│   ├── 0201.md
│   └── ...
├── script-01.sh           # Script to generate the JSON manifest
├── spurgeon-366-morning-devotions.json  # The main API endpoint
└── README.md
```

<br />

## 🚀 Why This Approach?

* **🆓 Free:** No server costs. GitHub acts as a static file server / CDN.
* **👶 Beginner-Friendly:** No complex backend setup (Node, Python, SQL) required.
* **🚀 Fast Updates:** Just push to the repo and the content is live.
* **🔒 Version Control:** Track all content changes over time.
* **🌍 Accessible:** Raw files can be fetched by any HTTP client (Retrofit, Ktor, etc.).

<br />

## 🔌 API Usage

### Base Endpoint (JSON Manifest)
The application fetches the full list of devotionals from this static JSON file:

`https://raw.githubusercontent.com/remelarp/spurgeon-366-morning-devotional-server/main/spurgeon-366-morning-devotions.json`

### Data Schema
The JSON response consists of an array of objects:

```json
[
  {
    "id": "0101",
    "title": "Entering the Promised Rest!",
    "urll": "[https://raw.githubusercontent.com/remelarp/spurgeon-366-morning-devotional-server/refs/heads/main/01-jan/0101.md](https://raw.githubusercontent.com/remelarp/spurgeon-366-morning-devotional-server/refs/heads/main/01-jan/0101.md)"
  }
]
```

<br />

## ✍️ Author

**Mohammad Arif**
- [GitHub Profile](https://github.com/remelarp)
