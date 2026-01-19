cd /workspace/forum-web-app-rebuild/backend
cat <<'EOF' > schema.sql
-- Users (username-only auth)
CREATE TABLE IF NOT EXISTS users (
  username TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS topics (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  creator_username TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (creator_username) REFERENCES users(username)
);

CREATE TABLE IF NOT EXISTS posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  topic_id INTEGER NOT NULL,
  creator_username TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  likes_count INTEGER DEFAULT 0,
  FOREIGN KEY (topic_id) REFERENCES topics(id),
  FOREIGN KEY (creator_username) REFERENCES users(username)
);

CREATE TABLE IF NOT EXISTS comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  content TEXT NOT NULL,
  post_id INTEGER NOT NULL,
  creator_username TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (post_id) REFERENCES posts(id),
  FOREIGN KEY (creator_username) REFERENCES users(username)
);
EOF
