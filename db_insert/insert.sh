# mysql -h ${MYSQL_HOST} -P 3306 -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < insert.sql
mysql -h ${MYSQL_HOST} -P 3306 -u ${MYSQL_USER} -p${MYSQL_PASSWORD} \
-e "INSERT INTO item (name, bcit_id) VALUES ('${STUDENT_NAME}', '${BCIT_ID}');" \
${MYSQL_DATABASE}