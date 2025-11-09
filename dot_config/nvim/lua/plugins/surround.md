# 🌀 mini.surround

**Fast and feature-rich surround actions for Neovim**
📦 GitHub: [nvim-mini/mini.surround](https://github.com/nvim-mini/mini.surround)

`mini.surround` lets you **add, delete, replace, find, and highlight** surroundings like parentheses, quotes, brackets, tags, and more.

---

## ✨ Features

* Full support for **dot-repeat**, `v:count`, and multiple search methods.
* Extended mappings for **“last”** and **“next”** searches.
* Highly customizable via Lua patterns and functions.
* Built-in support for:

  * Brackets `() [] {}`
  * Function calls
  * Tags `<...>`
  * User prompts
  * Any alphanumeric, punctuation, or whitespace character
* Configuration modeled after **tpope/vim-surround**.

---

## ⌨️ Default Keymaps (LazyVim)

📖 Docs: [LazyVim mini.surround](https://www.lazyvim.org/extras/coding/mini-surround)

* **`gsa`** → Add surrounding (Normal & Visual mode)
* **`gsd`** → Delete surrounding
* **`gsr`** → Replace surrounding
* **`gsf`** → Find surrounding to the **right**
* **`gsF`** → Find surrounding to the **left**
* **`gsh`** → Highlight surrounding
* **`gsn`** → Update `n_lines` (adjust search range)

---

## ⌨️ Default Keymaps with ✅ Examples

### 🔹 Add (`gsa`)

* `gsaiw)` → Surround the inner word with `()`

  ```
  word   →   (word)
  ```

* Visual mode: select text → `gsa'` → surround selection with `'...'`

---

### 🔹 Delete (`gsd`)

* `gsd"` → Remove surrounding quotes

  ```
  "hello"   →   hello
  ```

* `gsd)` → Remove surrounding parentheses

  ```
  (test)   →   test
  ```

---

### 🔹 Replace (`gsr`)

* `gsr)"` → Change parentheses to quotes

  ```
  (hello)   →   "hello"
  ```

* `gsr"'` → Change double quotes to single quotes

  ```
  "yes"   →   'yes'
  ```

---

### 🔹 Find (`gsf` / `gsF`)

* `gsf)` → Jump to the **next** `(...)` pair
* `gsF"` → Jump to the **previous** `"..."` pair

---

### 🔹 Highlight (`gsh`)

* `gsh)` → Temporarily highlight the nearest `(...)`

---

### 🔹 Update n\_lines (`gsn`)

* `gsn` → Change how many lines Neovim searches for surroundings (default: `20`)

---

## 🔧 LazyVim Extras

Enable via **`:LazyExtras`**.
Plugins marked as **optional** are only configured if installed.

