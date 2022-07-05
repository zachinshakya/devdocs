#! /bin/sh
DIR=.

DB_NAME=audience

DUMP_NAME="$(date +%s).sql"
DUMP_PATH="$DIR/$DB_NAME_$DUMP_NAME"

echo "***********DUMPING TO SQL***********"
# DUMP the database
PGPASSWORD="your_password" pg_dump -U postgres $DB_NAME > $DUMP_PATH

echo "***********CREATING TAR FILE***********"
tar -czf "$DUMP_NAME.gz" "$DUMP_NAME"

echo "***********REMOVING SQL FILE***********"
# Remove the dump file from disk
rm $DUMP_PATH

DUMP_KEY=$DUMP_PATH | cut -c 3- # Remove the ./ from the path

# Upload the dump file to S3
s3cmd -c "/home/debian/.s3cfg" put "$DUMP_PATH.gz" s3://$DB_NAME-db-backup/$DB_NAME/$DUMP_KEY

echo "***********REMOVING TAR GZ FLE***********"
# Remove the dump file from disk
rm "$DUMP_PATH.gz"
