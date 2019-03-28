mysqldump \
  --user="${DEST_USER}" \
  --password="${DEST_PASS}" \
  --host="${DEST_HOST}" \
  --add-drop-table \
  --no-data "${DEST_NAME}" | \
  grep -e ^DROP -e FOREIGN_KEY_CHECKS | \
  mysql \
  --user="${DEST_USER}" \
  --password="${DEST_PASS}" \
  --host="${DEST_HOST}" \
  "${DEST_NAME}"

echo -e "Loading export into destination database."
mysql \
  --user="${DEST_USER}" \
  --password="${DEST_PASS}" \
  --host="${DEST_HOST}" \
  "${DEST_NAME}" \
  < /sql/dump.sql

echo -e "Sync completed."
