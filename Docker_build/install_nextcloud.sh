wget https://download.nextcloud.com/server/releases/nextcloud-${VERSION}.zip && unzip nextcloud-${VERSION}.zip -d /var/www/html/ && rm nextcloud-${VERSION}.zip

#Add support of KeeWeb

#sed -i -e "542i \\\t\t\t//KeeWeb Client" /var/www/html/nextcloud/lib/base.php
#sed -i -e "542i \\\t\t\t'/keeweb/\\\d[.]\\\d[.]\\\d/'," /var/www/html/nextcloud/lib/base.php

#create ocdata in data directory
mkdir /var/www/html/nextcloud/data
touch /var/www/html/nextcloud/data/.ocdata

#Install addition apps
cd /var/www/html/nextcloud/apps

wget https://github.com/theCalcaholic/nextcloud-secrets/releases/download/v2.1.3/secrets.tar.gz
wget https://github.com/LibreSign/libresign/releases/download/v8.3.2/libresign-v8.3.2.tar.gz
wget https://github.com/rotdrop/nextcloud-app-files-archive/releases/download/v1.2.3/files_archive.tar.gz
#wget https://github.com/nextcloud-releases/mail/releases/download/v3.7.24/mail-v3.7.24.tar.gz
wget https://snappymail.eu/repository/nextcloud/snappymail-2.38.2-nextcloud.tar.gz
wget https://github.com/nextcloud-releases/contacts/releases/download/v5.5.3/contacts-v5.5.3.tar.gz
wget https://github.com/nextcloud-releases/calendar/releases/download/v4.7.18/calendar-v4.7.18.tar.gz
wget https://github.com/nextcloud-releases/spreed/releases/download/v18.0.14/spreed-v18.0.14.tar.gz
wget https://github.com/nextcloud-releases/files_retention/releases/download/v1.17.2/files_retention-v1.17.2.tar.gz
wget https://github.com/nextcloud-releases/deck/releases/download/v1.12.7/deck-v1.12.7.tar.gz
wget https://github.com/nextcloud-releases/user_external/releases/download/v3.4.0/user_external-v3.4.0.tar.gz
wget https://files.snyman.info/externalpassword/v1.1.2/externalpassword.tar.gz
wget https://releases.passman.cc/passman_2.4.12.tar.gz
wget https://github.com/eldertek/duplicatefinder/releases/download/v1.7.3/duplicatefinder-v1.7.3.tar.gz
wget https://github.com/nextcloud-releases/user_saml/releases/download/v6.6.0/user_saml-v6.6.0.tar.gz
wget https://github.com/nextcloud-releases/socialsharing/releases/download/v3.3.0/socialsharing_email.tar.gz
wget https://github.com/nextcloud-releases/event_update_notification/releases/download/v2.4.0/event_update_notification-v2.4.0.tar.gz
wget https://github.com/eideasy/nextcloud-electronic-signatures-plugin/releases/download/v3.0.4/v3.0.4.tar.gz
wget https://github.com/nextcloud-releases/notes/releases/download/v4.12.2/notes.tar.gz
wget https://github.com/matiasdelellis/quicknotes/releases/download/v0.8.23/quicknotes.tar.gz
wget https://github.com/nextcloud/tasks/releases/download/v0.16.1/tasks.tar.gz
wget https://github.com/nextcloud-releases/groupquota/releases/download/v0.2.1/groupquota-v0.2.1.tar.gz
wget https://github.com/nextcloud-releases/quota_warning/releases/download/v1.20.0/quota_warning-v1.20.0.tar.gz
#wget https://github.com/nextcloud/integration_reddit/releases/download/v2.0.2/integration_reddit-2.0.2.tar.gz
wget https://github.com/nextcloud/bookmarks/releases/download/v14.2.7/bookmarks-14.2.7.tar.gz
wget https://github.com/nextcloud-releases/registration/releases/download/v2.4.0/registration-v2.4.0.tar.gz
wget https://github.com/nextcloud-releases/previewgenerator/releases/download/v5.9.0/previewgenerator-v5.9.0.tar.gz
wget https://github.com/SergeyMosin/Appointments/raw/v2.3.5/build/artifacts/appstore/appointments.tar.gz
wget https://github.com/nextcloud/integration_google/releases/download/v3.2.0/integration_google-3.2.0.tar.gz
# wget https://github.com/nextcloud-releases/assistant/releases/download/v1.0.2/assistant-v1.0.2.tar.gz (Nextcloud 27)
for i in $(ls *.tar.gz)
do
        tar -vxf	$i
        rm -rf $i
done

#Fix the permission for nextcloud
chown www-data:www-data -R /var/www/html/nextcloud
